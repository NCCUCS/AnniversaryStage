class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates_presence_of :image, :on => :create, :message => "can't be blank"
end
