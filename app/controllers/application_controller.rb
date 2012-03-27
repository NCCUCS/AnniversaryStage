class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def user_authentication
    @user = User.find_or_create_by_access_token params[:access_token]
  end
  
end
