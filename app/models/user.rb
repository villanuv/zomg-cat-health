class User < ActiveRecord::Base
  # validations
  validates :username, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_secure_password

  # associations
  has_many :cats
end
