class Product < ApplicationRecord
  has_many_attached :photos
  has_many :line_items, dependent: :nullify
  has_many :favorites
  belongs_to :subcategory

  validates :description, :name, :price_cents, :subcategory_id, presence: true

  monetize :price_cents
  validates :price_cents, numericality: { greater_than_or_equal_to: 1 }

  validates :discount_price_cents, presence: true, numericality: { greater_than_or_equal_to: 0 }, comparison: { less_than: :price_cents, message: ": Le prix promo doit être inférieur au prix hors promo." }

  delegate :category, to: :subcategory, allow_nil: true

  # en attente de debug error pour les images
  # validate :images, presence: true

  # NE PAS SUPPRIMER
  # include PgSearch::Model

  # multisearchable against: [ :name ]

  # pg_search_scope :global_search,

  # against: [ :name, :description, :sku ],

  # associated_against: {
  #   subcategory: [ :name ]
  # },

  # using: {
  #   tsearch: { prefix: true }
  # }

end
