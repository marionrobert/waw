class PagesController < ApplicationController
  include CurrentCart

  skip_before_action :authenticate_user!, only: %i[home index]



  def home
    @shop = Shop.last
    @products = Product.last(3)
    @categories = Category.all
    @subcategories = Subcategory.all
  end

  def profile
    @my_pending_orders = current_user.orders.where(state: "pending").order(updated_at: :desc)
    @my_past_orders = current_user.orders.where(state: "delivered").order(updated_at: :desc)
    @admin_pending_orders = Order.where(state: "pending").order(updated_at: :desc)
    @admin_past_orders = Order.where(state: "delivered").order(updated_at: :desc)
  end

  def is_admin
    @user = User.signed_in(params[:admin == "true"])
  end

end
