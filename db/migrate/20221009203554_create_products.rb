class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.text :description
      t.text :full_description
      t.string :images, array: true, default: []
      t.integer :stock_quantity
      t.integer :supplier_delay
      t.timestamps
      t.references :subcategory, null: false, foreign_key: true
    end
  end
end
