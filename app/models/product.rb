class Product < ApplicationRecord
  before_save :ensure_discount_ending_date

  ORIENTATION = ["paysage", "portrait", "carré"]
  FRAME_QUANTITY = [1, 2, 3, 4, 5, 6]
  SUPPORT = [ "Fine_art_315g",
              "Fine_art_315g_avec_marge_blanche",
              "Toile_chassis_100%_lin_400g",
              "Toile_chassis_100%_lin_400g_caisse_americaine_bois_naturel",
              "Toile_chassis_100%_lin_400g_caisse_americaine_blanche",
              "Toile_chassis_100%_lin_400g_caisse_americaine_noire"]

  has_one :visit, dependent: :destroy
  has_many_attached :photos
  has_many_attached :watermarks
  validates :width, presence: true
  validates :height, presence: true
  validates :support, presence: true
  validates :frame_quantity, presence: true
  validates :meta_description, presence: true
  has_many :line_items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :orientation, inclusion: { in: ORIENTATION }
  belongs_to :subcategory
  validates :subcategory, presence: true
  validates :stock_quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :description, :name, :price_cents, :subcategory_id, :sku, :supplier_delay, presence: true
  has_rich_text :full_description
  validates :price_cents, numericality: { greater_than_or_equal_to: 1 }
  validates :supplier_delay, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 65, message: ": Le délai fournisseur doit être compris entre 0 et 65 jours." }
  validates :discount_price_cents, presence: true, numericality: { greater_than_or_equal_to: 0 }, comparison: { less_than: :price_cents, message: ": Le prix promotionnel doit être inférieur au prix d'origine." }
  monetize :price_cents
  delegate :category, to: :subcategory, allow_nil: true

  def self.update_items(items:)
    content = content_from_order(items:)
    decrease_stock_quantities(content:)
  end

  def ensure_discount_ending_date
    if discount_price_cents.positive? && discount_ending_date.blank?
      errors.add(:discount_ending_date, "must be present if discount price is set")
      throw(:abort)
    end
  end

  def self.content_from_order(items:)
    items.map do |key, item|
      {
        sku: item["sku"],
        quantity: item["quantity"]
      }
    end
  end

  def self.decrease_stock_quantities(content:)
    # a mettre en console pour simuler
    # OrdersController.new.paid(checkout_session_id:Order.where.not(checkout_session_id: [nil, ""]).first.checkout_session_id)
    content.each do |product_quantity|
      product = Product.find_by(sku: product_quantity[:sku])
      product.update(stock_quantity: product.stock_quantity - product_quantity[:quantity] )
      # product.update(stock_quantity: product.stock_quantity + product_quantity[:quantity] )
      # product.update(stock_quantity: product.stock_quantity + product_quantity[:quantity] )
    end
  end
end
