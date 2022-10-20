class Order < ApplicationRecord
  belongs_to :product
  # validates :product_id, dependent: :destroy
  belongs_to :user
  monetize :amount_cents
end
