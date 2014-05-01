class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  has_many :questions
  has_many :answers
end
