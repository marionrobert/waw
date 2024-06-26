class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :set_number_icon_cart
  before_action :destroy_pending_orders, only: %i[create]
  before_action :set_stock_delay, only: %i[create]

  def index
    @orders = Order.all
  end

  def show
    if current_user.admin
      @order = Order.find(params[:id])
    else
      @order = current_user.orders.find(params[:id])
    end
    @sub_total = []
    @order.items.each do |key, _value|
      @sub_total << ((@order.items[key]["quantity"]) * (@order.items[key]["unit_amount"]) / 100.00)
    end
  end

  def new
    @order = Order.new
  end

  def create
    # call private methods: set_stock_delay and destroy_pending_orders

    # pour l'achat immédiat d'un seul article sans création de panier (il faudra faire un if /else --> passage par panier ou pas)
    # product = Product.find(params[:product_id])
    @items_for_stripe = []
    @cart.line_items.each do |item|
      actualprice = 0
      if item.product.discount_price_cents.positive? && item.product.discount_price_cents < item.product.price_cents
        actualprice = item.product.discount_price_cents
      else
        actualprice = item.product.price_cents
      end
      main_product = Product.where(name: item.product.name).where(main: true).first
      if main_product.photos.attached?
        image_src = cl_image_path(main_product.photos.first.key, secure: true)
      else
        image_src = "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
      end
      new_item = {
        price_data: {
          currency: 'eur',
          unit_amount: actualprice,
          product_data: {
            name: item.product.sku,
            description: item.product.description,
            images: [image_src]
          }
        },
        quantity: item[:quantity]
      }
      @items_for_stripe << new_item
    end

    @items_for_order = {}
    @cart.line_items.each.with_index do |item, index|
      actualprice = 0
      if item.product.discount_price_cents.positive? && item.product.discount_price_cents < item.product.price_cents
        actualprice = item.product.discount_price_cents
      else
        actualprice = item.product.price_cents
      end
      new_item = {
        unit_amount: actualprice,
        sku: item.product.sku,
        name: item.product.name,
        quantity: item[:quantity]
      }
      @items_for_order["product_#{index}"] = new_item
    end

    order = Order.create!(user: current_user, items: @items_for_order)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      allow_promotion_codes: true,
      shipping_address_collection: {
        allowed_countries: ['US', 'FR']
      },
      shipping_options: [
        {
          shipping_rate_data: {
            type: 'fixed_amount',
            fixed_amount: {
              amount: 0,
              currency: 'eur'
            },
            display_name: 'Livraison offerte',
            # Delivers between 5-7 business days
            delivery_estimate: {
              minimum: {
                unit: 'business_day',
                value: @stock_delay
              },
              maximum: {
                unit: 'business_day',
                value: @stock_delay + 7
              }
            }
          }
        }
        # },
        # {
        #   shipping_rate_data: {
        #     type: 'fixed_amount',
        #     fixed_amount: {
        #       amount: 1500,
        #       currency: 'eur'
        #     },
        #     display_name: 'Livraison express',
        #     # Delivers in exactly 1 business day
        #     delivery_estimate: {
        #       minimum: {
        #         unit: 'business_day',
        #         value: @stock_delay
        #       },
        #       maximum: {
        #         unit: 'business_day',
        #         value: @stock_delay + 2
        #       }
        #     }
        #   }
        # }
      ],
      line_items: @items_for_stripe,
      mode: 'payment',
      success_url: order_url(order),
      cancel_url: order_url(order)
    )
    # à gérer avec un webhook,
    # si le client choisit livraison express -> estimated_delivery_time = @stock_delay + 2
    # si le client choisit livraison normale -> estimated_delivery_time = @stock_delay + 2
    order.update(checkout_session_id: session.id, estimated_delivery_time: @stock_delay + 7)
    redirect_to new_order_payment_path(order)
  end

  def destroy
  end

  def paid(checkout_session_id:)
    # A rentrer en console pour tester
    # OrdersController.new.paid(checkout_session_id:Order.where.not(checkout_session_id: [nil, ""]).first.checkout_session_id)
    # debugger
    order = Order.find_by(checkout_session_id:)
    order.update(state: 'paid')
    Product.update_items(items: order.items)
  end

  private

  def set_stock_delay
    all_delivery_delays = []
    products_not_available = []
    @cart.line_items.each do |item|
      if item.product.stock_quantity.zero?
        products_not_available << item.product
        all_delivery_delays << item.product.supplier_delay
      end
    end

    if products_not_available.length.positive?
      @stock_delay = all_delivery_delays.max
    else
      @stock_delay = 3
    end
  end

  def destroy_pending_orders
    pending_orders = current_user.orders.where(state: "pending")
    if pending_orders.count.positive?
      pending_orders.destroy_all
    end
  end

  # def order_params
  #   params.require(:order).permit(:user_id, :product_id)
  # end
end
