class User < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :accounts

  validates :email, presence: true
end
