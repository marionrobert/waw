class Product < ApplicationRecord
  monetize :price_cents
  has_many_attached :photos
  has_many :line_items, dependent: :nullify

  has_many :favorites

  belongs_to :subcategory
  validates :description, :name, :price_cents, :subcategory_id, presence: true
  validates :discount_price_cents, presence: true
  delegate :category, to: :subcategory, allow_nil: true

  # ne fonctionne pas
  # before_save :check_promo



  #en attente de debug error pour les images
  #validate :images, presence: true

  scope :filter_by_name, -> (name) { where('name ILIKE ?', "%#{name}%") }


  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [ :name],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  # ne fonctionne pas
  # private
  #   def check_promo
  #     self.discount_price_cents < self.price_cents
  #   end
end
