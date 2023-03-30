class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.integer :count, default: 0
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
