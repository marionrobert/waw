class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :state
      t.string :product_sku
      t.string :checkout_session_id
      t.integer :amount_cents, default: 0, null: false
      t.timestamps
    end
  end
end
