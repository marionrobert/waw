class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      # t.string :name, null: false
      # t.text :address, null: false
      # t.string :email, null: false
      # t.integer :status, null: false, default: 0
      # t.references :cart, foreign_key: true
      t.json :items
      t.references :user, null: false, foreign_key: true
      t.string :state, default: "pending"
      t.string :checkout_session_id
      t.integer :estimated_delivery_time
      t.timestamps
    end
  end
end
