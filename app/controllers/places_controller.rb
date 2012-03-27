class PlacesController < ApplicationController
  
  def index
    @places = Place.order('id DESC').page params[:page]
    
    render json: @places
  end
  
end
