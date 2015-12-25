class CreateGooglemaps < ActiveRecord::Migration
  def change
    create_table :googlemaps do |t|
      t.integer :post_id
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
