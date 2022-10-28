class Order < ApplicationRecord
  # validates :product_id, dependent: :destroy
  belongs_to :user
  belongs_to :cart
  # monetize :amount_cents
end
