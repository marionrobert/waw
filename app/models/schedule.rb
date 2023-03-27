class Schedule < ApplicationRecord
  belongs_to :shop, dependent: :destroy
end
