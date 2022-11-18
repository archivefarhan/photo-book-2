class User < ApplicationRecord
  has_secured_password
  validates :email, presence: true, uniqueness: true
end
