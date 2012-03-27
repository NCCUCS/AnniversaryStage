class PhotosController < ApplicationController
  
  before_filter :user_authentication, :only => [:create]
  
  def index
    if params[:place_id]
      @place = Place.find params[:place_id]
      @photos = @place.photos.order('id DESC').page params[:page]
    else
      @photos = Photo.order('id DESC').page params[:page]
    end
    
    render json: @photos
  end
  
  def show
    @photo = Photo.find(params[:id])
    
    render json: @photo
  end
  
  def create
    @photo = @user.photos.new(params[:photo])
    
    if @photo.save
      render json: @photo, status: :created, location: @photo 
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end
  
end
