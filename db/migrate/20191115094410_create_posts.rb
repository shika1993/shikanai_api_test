class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :sta_name
      t.float :geolat
      t.float :geolong
      t.timestamps
    end
  end
end
