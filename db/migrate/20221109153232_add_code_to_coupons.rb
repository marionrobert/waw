class AddCodeToCoupons < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :code, :string
    add_column :coupons, :stripe_id, :string
    add_column :coupons, :first_time_transaction, :boolean
    add_column :coupons, :minimum_amount, :integer

  end
end
