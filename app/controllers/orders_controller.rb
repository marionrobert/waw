class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order)
  end

  def update
  end

  def destroy
  end

private
  def order_params
    params.require(:order).permit(:user_id, :product_id)
  end
end
