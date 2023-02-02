class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :siren
      t.string :phone
      t.string :address
      t.string :card
      t.string :themebgcolor, default: "white"
      t.string :themefont, default: "arial"
      t.string :bannerpub
      t.string :leftbodybanner
      t.string :rightbodybanner
      t.string :juridicform
      t.integer :capitalisation
      t.string :localregister
      t.string :email
      t.string :president
      t.string :uetva
      t.timestamps
    end
  end
end
