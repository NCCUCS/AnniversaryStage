# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes
  include CarrierWave::MiniMagick

  # Choose storage type
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Resize as they are uploaded
  process :resize_to_fit => [640, 640]

  # Create thumb version of uploade file
  version :thumb do
    process :resize_to_fit => [320, 320]
  end
  
  # mime-types
  process :set_content_type

  # Whitelist
  def extension_white_list
    %w(jpg jpeg)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
