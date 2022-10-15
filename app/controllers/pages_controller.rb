class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home index]

  def home
    @products = Product.last(3)
  end

  def profil
    @user = current_user
  end
end
