class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  monetize :amount_cents

end
