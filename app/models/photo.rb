class Photo < ActiveRecord::Base
  # CarrierWave
  mount_uploader :image, ImageUploader
  validates_presence_of :image, :on => :create, :message => "can't be blank"
  
  # will_paginate
  self.per_page = 16
end
