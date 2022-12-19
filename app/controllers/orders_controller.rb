class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart

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
    @order.items.each do |key, value|
      @sub_total << ((@order.items[key]["quantity"]) * (@order.items[key]["unit_amount"]) / 100.00)
    end
  end

  def new
    @order = Order.new
  end

  def create
    # pour l'achat immédiat d'un seul article sans création de panier (il faudra faire un if /else --> passage par panier ou pas)
    # product = Product.find(params[:product_id])
    @items_for_stripe = []
    @cart.line_items.each do |item|
      actualprice = 0
      if item.product.discount_price_cents > 0 && item.product.discount_price_cents < item.product.price_cents
        actualprice = item.product.discount_price_cents
      else
        actualprice = item.product.price_cents
      end
      new_item = {
        price_data: {
          currency: 'eur',
          unit_amount: actualprice,
          product_data: {
            name: item.product.sku,
            description: item.product.description,
            # images: item.photos.first.key
          }
        },
        quantity: item[:quantity]
      }
      @items_for_stripe << new_item
    end

    @items_for_order = {}
    @cart.line_items.each.with_index do |item, index|
    actualprice = 0
    if item.product.discount_price_cents > 0 && item.product.discount_price_cents < item.product.price_cents
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
              amount: 500,
              currency: 'eur',
            },
            display_name: 'Free shipping',
            # Delivers between 5-7 business days
            delivery_estimate: {
              minimum: {
                unit: 'business_day',
                value: 5,
              },
              maximum: {
                unit: 'business_day',
                value: 7,
              },
            }
          }
        },
        {
          shipping_rate_data: {
            type: 'fixed_amount',
            fixed_amount: {
              amount: 1500,
              currency: 'eur',
            },
            display_name: 'Next day air',
            # Delivers in exactly 1 business day
            delivery_estimate: {
              minimum: {
                unit: 'business_day',
                value: 1,
              },
              maximum: {
                unit: 'business_day',
                value: 1,
              },
            }
          }
        },
      ],
      line_items: @items_for_stripe,
      mode: 'payment',
      success_url: order_url(order),
      cancel_url: order_url(order)
    )
    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end


  def destroy
  end

# private
#   def order_params
#     params.require(:order).permit(:user_id, :product_id)
#   end
end
