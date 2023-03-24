class Role < ApplicationRecord
  has_many :users_roles, class_name: 'UsersRole'
  has_many :users, through: :users_roles, class_name: 'UsersRole'

  validates :name, presence: :true
  validates_uniqueness_of :name, case_sensitive: false
end
