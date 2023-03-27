class PaymentsController < ApplicationController
  include CurrentCart

  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
