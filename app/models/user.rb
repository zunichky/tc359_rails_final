class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :event, :scope => :email, :message=>"{{value}} is already taken"
end
