class CreateTag < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :tag_name
    end
  end
end
