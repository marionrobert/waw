class PagesController < ApplicationController
  include CurrentCart

  skip_before_action :authenticate_user!, only: %i[home legal cgv]

  def home
    @shop = Shop.last
    @products = Product.all
    @blogposts = Blogpost.last(5)
    @categories = Category.all
    @subcategories = Subcategory.all
    @last_products = Product.last(15)
    @products_in_stock = Product.where("stock_quantity > 0").first(20)

    all_promo = []
    @products_with_discount = Product.where("discount_price_cents > 0")
    @products_with_discount.each do |product|
      all_promo << (100-((product.discount_price_cents).to_f / (product.price_cents).to_f)*100).round(0)
    end
    @promo_max = all_promo.max
  end

  def legal
  end

  def cgv
  end

  def profile
    every_supplier_delay = []
    Product.all.each do |product|
      every_supplier_delay << product.supplier_delay
    end
    # @average_supplier_delay = every_supplier_delay.sum / every_supplier_delay.size BUG


    # ajouté mais c'est pas la bonne facon de faire, la partial ne prend pas le bon controller
    @product = Product.new
    @coupons = Coupon.all

    #blogpost
    @blogposts = Blogpost.all

    #shop
    @shop = Shop.first

    # stockmanager
    @products = Product.all



    #category formulaire de creation
    @category = Category.new
    @categories = Category.all

    @subcategory = Subcategory.new


    @order = current_user.orders.where(state: "pending").last
    # orders for each client
    @my_pending_orders = current_user.orders.where(state: "pending").order(updated_at: :desc)
    @my_paid_orders = current_user.orders.where(state: "paid").order(updated_at: :desc)
    @my_delivered_orders = current_user.orders.where(state: "delivered").order(updated_at: :desc)

    # orders for admin
    @admin_paid_orders = Order.where(state: "paid").order(updated_at: :desc)
    @admin_delivered_orders = Order.where(state: "delivered").order(updated_at: :desc)
    @admin_all_orders = Order.where.not(state: "pending").order(updated_at: :desc)

    # calcul chiffre d'affaires
    turnover = []
    @admin_all_orders.each do |order|
      order.items.each do |key, _value|
        turnover << ((order.items[key]["quantity"]) * (order.items[key]["unit_amount"]) / 100.00)
      end
    end
    @total_turnover = turnover.sum
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
