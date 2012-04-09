class ApplicationController < ActionController::Base
  protect_from_forgery
  
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  def user_authentication
    @user = User.find_or_create_by_access_token params[:access_token]
  end
  
end
