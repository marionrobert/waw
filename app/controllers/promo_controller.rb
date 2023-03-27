class PromoController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]


  def index
    @products = Product.where("discount_price_cents > 0")
    # scope :products, -> { where("discount_price_cents > 20") }
  end
end
