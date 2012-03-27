class User < ActiveRecord::Base
  
  validates_presence_of :access_token
  validates_uniqueness_of :email
  validates_presence_of :email
  
  def find_or_create_by_access_token(token)
    user = User.find_by_access_token token
    
    unless user
      graph = Koala::Facebook::API.new token
      profile = graph.get_object "me"
      email = profile["email"]
    
      user = User.find_or_create_by_email email
      user.fid = profile["id"]
      user.name = profile["name"]
      user.access_token = token
      user.save
    end
    
    user
  end
  
end
