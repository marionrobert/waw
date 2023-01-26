class Category < ApplicationRecord
  validates :name, presence: true
  has_many :subcategories, dependent: :destroy
  has_many :products, through: :subcategories

  include PgSearch::Model
  multisearchable against: [:name]

end
