require "digest/sha1"
require "digest/sha2"
class User < ActiveRecord::Base
  has_many :contacts
  
  attr_accessor :password
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password
  validates_confirmation_of :password
  
  def before_save
    self.salt = generate_salt
    self.hashed_password = hash_password(self.password, self.salt)
  end
  
  def after_save
    @password = nil
  end
  
  def login
    user = User.find_by_email(self.email)
    
    if user
      if user.hashed_password == hash_password(self.password, user.salt)
        user
      else
        false
      end
    else
      false
    end
  end
  
  private
  def generate_salt
    Digest::SHA1.hexdigest(Time.now().to_s + rand().to_s)
  end
  
  def hash_password(password, salt)
    Digest::SHA512.hexdigest(password + salt)
  end
  
end
