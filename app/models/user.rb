class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
  has_secure_password
end
