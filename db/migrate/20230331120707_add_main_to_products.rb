class AddMainToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :main, :boolean, null: false, default: false
  end
end
