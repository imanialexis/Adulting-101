class CreatePost < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.datetime :created_at
      t.datetime :updated_at
      t.text :post_content
      t.string :photo_url
    end
  end
end
