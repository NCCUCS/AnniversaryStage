class AddPlaceIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :place_id, :integer
    add_index :photos, :place_id
    add_column :places, :photos_count, :integer, :default => 0
  end
end