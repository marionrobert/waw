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
      t.string :images, array: true, default: []
      t.integer :stock_quantity, default: 0
      t.date :discount_ending_date
      t.integer :supplier_delay, default: 14
      # t.string :main_product, default: "false", null: false
      t.timestamps
      t.references :subcategory, null: false, foreign_key: true
    end
  end
end
