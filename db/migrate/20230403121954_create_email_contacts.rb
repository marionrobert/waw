class CreateEmailContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :email_contacts do |t|
      t.string :email

      t.timestamps
    end
  end
end
