class Category < ApplicationRecord
  validates :name, presence: true
  has_many :subcategories, dependent: :destroy
  has_many :products, through: :sub_categories

  include PgSearch::Model
  multisearchable against: [:name]

end
