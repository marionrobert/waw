class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|

      t.string :name
      t.integer :amount_off
      t.string :currency
      t.string :duration
      t.integer :duration_in_months
      t.float :percent_off
      # TODO : applies_to
      t.integer :max_redemptions
      t.date :redeem_by

      t.timestamps
    end
  end
end
