class PhotosController < ApplicationController
  
  def index
    
  end
  
  def show
    
  end
  
  def create
    @photo = Photo.new(params[:photo])
    
    if @photo.save
      render json: @photo, status: :created, location: @photo 
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end
  
end
