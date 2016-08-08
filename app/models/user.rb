class User < ApplicationRecord
  has_secure_token
  has_secure_password
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
end
