class User < ActiveRecord::Base
  
  validates_presence_of :access_token
  validates_uniqueness_of :email
  validates_presence_of :email
  
  has_many :photos
  
  def self.find_or_create_by_access_token(token)
    graph = Koala::Facebook::API.new token
    profile = graph.get_object "me"
    fid = profile["id"].to_i
    
    user = User.find_by_access_token(token) || User.find_or_create_by_fid(fid)
    
    user.email = profile["email"]
    user.name = profile["name"]
    user.access_token = token
    user.save
    
    user
  end
  
end
