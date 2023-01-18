class CreateBlogposts < ActiveRecord::Migration[7.0]
  def change
    create_table :blogposts do |t|
      t.string :title
      t.text :content
      t.string :images, array: true, default: []
      t.timestamps
    end
  end
end
