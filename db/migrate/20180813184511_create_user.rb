class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :username
      t.string :email
      t.date :birthday
      t.string :photo_url
    end
  end
end
