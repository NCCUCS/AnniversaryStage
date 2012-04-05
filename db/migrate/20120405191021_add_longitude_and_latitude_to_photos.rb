class AddLongitudeAndLatitudeToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :longitude, :float
    add_column :photos, :latitude, :float
    add_index :photos, :longitude
    add_index :photos, :latitude
  end
end