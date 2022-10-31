class PagesController < ApplicationController
  include CurrentCart
  skip_before_action :authenticate_user!, only: %i[home index]

  def home
    # On ne parvient pas à recupere le current_cart
    # @cart = Cart.find(params[:id])
    @products = Product.last(3)
  end

  def profil
    @user = current_user
  end

  def is_admin
    @user = User.signed_in(params[:admin == "true"])
  end

end
