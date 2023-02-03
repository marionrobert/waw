class PagesController < ApplicationController
  include CurrentCart

  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @shop = Shop.last
    @products = Product.last(10)
    @blogposts = Blogpost.last(5)
    @categories = Category.all
    @subcategories = Subcategory.all
  end

  def profile
    @order = current_user.orders.where(state: "pending").last
    @my_pending_orders = current_user.orders.where(state: "pending").order(updated_at: :desc)
    @my_paid_orders = current_user.orders.where(state: "paid").order(updated_at: :desc)
    @my_delivered_orders = current_user.orders.where(state: "delivered").order(updated_at: :desc)
    @admin_paid_orders = Order.where(state: "paid").order(updated_at: :desc)
    @admin_delivered_orders = Order.where(state: "delivered").order(updated_at: :desc)
    @admin_all_orders = Order.where.not(state: "pending").order(updated_at: :desc)
    @turnover = []
    @admin_all_orders.each do |order|
      order.items.each do |key, _value|
        @turnover << ((order.items[key]["quantity"]) * (order.items[key]["unit_amount"]) / 100.00)
      end
    end
  end

  def stockmanagement
    @products = Product.all
    redirect_to products_path unless current_user.admin
  end

  # méthode utilisée nulle part car  équivalent de .admin
  # def is_admin
  #   @user = User.signed_in(params[:admin == "true"])
  # end
end
