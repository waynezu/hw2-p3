class User < ActiveRecord::Base
  attr_accessible :username,  :password, :password_confirmation
	before_save :create_remember_token   
  has_many :posts
  has_many :comments
  
  validates :password, presence:true
  validates :password_confirmation, presence: true
  validates :username, presence:true, uniqueness:true
  has_secure_password
  private
	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end   
end
