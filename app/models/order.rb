class Order < ApplicationRecord
  # validates :product_id, dependent: :destroy
  belongs_to :user
  # monetize :amount_cents
end
