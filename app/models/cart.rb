class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def total
    line_items.to_a.sum(&:total)
  end

  def add_product(product)
    item = line_items.find_by(product: product)

    if item
      item.quantity += 1
    else
      item = line_items.new(product: product)
    end

    item

  end
end
