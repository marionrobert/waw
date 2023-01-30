class Category < ApplicationRecord
  validates :name, presence: true
  has_many :subcategories, dependent: :destroy
  has_many :products, through: :subcategories

  # NE PAS SUPPRIMER
  # include PgSearch::Model
  # multisearchable against: [ :name ]

end
