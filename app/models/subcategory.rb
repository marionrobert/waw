class Subcategory < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  belongs_to :category
  has_many :products, dependent: :destroy


end
