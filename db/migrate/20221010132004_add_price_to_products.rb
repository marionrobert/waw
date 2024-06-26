class AddPriceToProducts < ActiveRecord::Migration[7.0]
  def change
    add_monetize :products, :price, currency: { present: false }
    add_monetize :products, :discount_price, currency: { present: false}
  end
end
