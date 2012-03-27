class Photo < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user_id
  
  # CarrierWave
  mount_uploader :image, ImageUploader
  validates_presence_of :image, :on => :create, :message => "can't be blank"
  
  # will_paginate
  self.per_page = 16
end
