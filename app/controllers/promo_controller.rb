class PromoController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]


  def index
    @pagy, @products = pagy(Product.where("discount_price_cents > 0").where(main: true).order(:name))
    # scope :products, -> { where("discount_price_cents > 20") }
  end
end
