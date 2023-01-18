class PromoController < ApplicationController
  def index
    @products = Product.all
    # scope :products, -> { where("discount_price_cents > 20") }

  end
end
