class Product < ApplicationRecord
  has_many_attached :photos
  has_many :line_items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :subcategory
  validates :stock_quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :description, :name, :price_cents, :subcategory_id, :sku, :supplier_delay, presence: true
  has_rich_text :full_description
  validates :price_cents, numericality: { greater_than_or_equal_to: 1 }
  validates :supplier_delay, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 65, message: ": Le délai fournisseur doit être compris entre 0 et 65 jours." }
  validates :discount_price_cents, presence: true, numericality: { greater_than_or_equal_to: 0 }, comparison: { less_than: :price_cents, message: ": Le prix promotionnel doit être inférieur au prix d'origine." }
  monetize :price_cents
  validates :discount_ending_date, presence: true, if: :discount_price_positive?
  delegate :category, to: :subcategory, allow_nil: true

  def discount_price_positive?
    discount_price_cents.positive?
  end

# Fait crasher la seed si implementé dedans

  include PgSearch::Model
  multisearchable against: %i[name description]

  pg_search_scope :name_and_description_search,
                  against: %i[name description],
                  using: {
                    tsearch: {
                      prefix: true,
                      dictionary: "french"
                    }
                  }

  def self.update_items(items:)
    content = content_from_order(items:)
    decrease_stock_quantities(content:)
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

  def discount_price_positive?
    discount_price_cents > 0
  end

end
