class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    product = Product.find(params[:product_id])
    order  = Order.create!(product: product, product_sku: product.sku, amount: product.price, state: 'pending', user: current_user)
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'eur',
          unit_amount: product.price_cents,
          product_data: {
            name: product.sku,
            description: 'CETTE DESCRIPTION DOIT ETRE INTERPOLEE',
            # images: [product.images.first], MARCHE PAS POUR LE MOMENT FAUDRA TRAITER LE BUG
          },
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: order_url(order),
      cancel_url: order_url(order)
    )
    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end


  def destroy
  end

private
  def order_params
    params.require(:order).permit(:user_id, :product_id)
  end
end
