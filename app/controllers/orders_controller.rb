class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def index
    @orders = Order.all
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order.cart.line_items
  end

  def new
    @order = Order.new
  end

  def create
    # pour l'achat immédiat d'un seul article sans création de panier (il faudra faire un if /else --> passage par panier ou pas)
    # product = Product.find(params[:product_id])
    @items_for_stripe = []
    @cart.line_items.each do |item|
      new_item = {
        price_data: {
          currency: 'eur',
          unit_amount: item.product.price_cents,
          product_data: {
            name: item.product.sku,
            description: item.product.description,
            # images: item.product.photos.first
          }
        },
        quantity: item[:quantity]
      }
      @items_for_stripe << new_item
    end

    @items_for_order = {}
    @cart.line_items.each.with_index do |item, index|
      new_item = {
        unit_amount: item.product.price_cents,
        sku: item.product.sku,
        name: item.product.name,
        quantity: item[:quantity]
      }
      @items_for_order["product_#{index}"] = new_item
    end

    order = Order.create!(user: current_user, items: @items_for_order)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
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
