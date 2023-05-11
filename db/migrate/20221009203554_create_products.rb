class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.text :description
      t.string :meta_description
      t.text :full_description
      t.integer :width
      t.integer :height
      t.string :support
      t.integer :frame_quantity, default: 1
      t.string :orientation
      t.integer :stock_quantity, default: 0
      t.date :discount_ending_date, default: 30.days.from_now.to_date
      t.integer :supplier_delay, default: 14
      t.integer :render_price
      t.string :fournisseur
      t.integer :reward
      t.timestamps
      t.references :subcategory, null: false, foreign_key: true
    end
  end
end
