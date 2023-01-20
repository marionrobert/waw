class PagesController < ApplicationController
  include CurrentCart

  skip_before_action :authenticate_user!, only: %i[home index]

  def home
    @shop = Shop.last
    @products = Product.last(3)
    @blogposts = Blogpost.last(5)
    @categories = Category.all
    @subcategories = Subcategory.all
  end

  def profile
    @order = current_user.orders.where(state: "pending").last
    # les nom ne colle plus à l'état
    @my_pending_orders = current_user.orders.where(state: "pending").order(updated_at: :desc)
    @my_paid_orders = current_user.orders.where(state: "paid").order(updated_at: :desc)
    @my_past_orders = current_user.orders.where(state: "delivered").order(updated_at: :desc)
    @admin_paid_orders = Order.where(state: "paid").order(updated_at: :desc)
    @admin_past_orders = Order.where(state: "delivered").order(updated_at: :desc)
  end

  def is_admin
    @user = User.signed_in(params[:admin == "true"])
  end

end
