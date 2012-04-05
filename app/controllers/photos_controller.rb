class PhotosController < ApplicationController
  
  before_filter :user_authentication, :only => [:create]
  
  def index
    if params[:place_id]
      @place = Place.find params[:place_id]
      @photos = @place.photos.order('id DESC').page params[:page]
    else
      @photos = Photo.includes(:user).order('id DESC').page params[:page]
    end
  end
  
  def show
    @photo = Photo.includes(:user).find(params[:id])
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
