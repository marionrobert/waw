class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  # Mise en place de ce validates en double protection depuis PR 90
  validates :quantity, numericality: { greater_than: 0 }

  def total
    if product.discount_price_cents.positive?
      return product.discount_price_cents * quantity
    else
      return product.price_cents * quantity
    end
  end

  def total_basic
    product.price_cents * quantity
  end

  def total_discount
    product.discount_price_cents * quantity
  end
end
