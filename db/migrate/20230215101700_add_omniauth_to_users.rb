class AddOmniauthToUsers < ActiveRecord::Migration[7.0]
  def change
    # add_column :users, :provider, :string
    # add_column :users, :uid, :string
    add_column :users, :facebook_picture_url, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :token, :string
    add_column :users, :token_expiry, :datetime
  end
end
