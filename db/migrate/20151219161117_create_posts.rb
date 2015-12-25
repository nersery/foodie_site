class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :category
      t.float :valuation
      t.integer :budget
      t.string :distance
      t.string :solbab
      t.integer :user_id
      t.text :content
      t.string :image

      t.timestamps null: false
    end
  end
end
