class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  # Mise en place de ce validates en double protection depuis PR 90
  validates :quantity, numericality: { greater_than: 0 }

  def total
    product.price * quantity
  end
end
