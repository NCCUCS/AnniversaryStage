class PhotosController < ApplicationController
  
  before_filter :user_authentication, :only => [:create]
  
  def index
    @photos = Photo.order('id DESC').paginate(:page => params[:page])
    
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
