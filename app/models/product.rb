class Product < ApplicationRecord
  monetize :price_cents
  has_many_attached :photos
  has_many :line_items, dependent: :nullify

  validates :description, :name, :price_cents, presence: true
  #en attente de debug error pour les images
  #validate :images, presence: true


  include PgSearch::Model
    pg_search_scope :search_by_name,
      against: [ :name],
      using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
      }
end
