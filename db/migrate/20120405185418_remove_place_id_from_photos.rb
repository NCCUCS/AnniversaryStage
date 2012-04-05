class RemovePlaceIdFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :place_id
  end
end