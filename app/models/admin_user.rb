class AdminUser < ActiveRecord::Base
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
end