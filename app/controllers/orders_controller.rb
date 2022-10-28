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
    @all_items = []
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
      @all_items << new_item
    end
    order = Order.new(state: 'pending', user: current_user)
    order.cart = @cart
    order.save!
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: @all_items,
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
