class User < ApplicationRecord
    has_secure_password
    validates :password, confirmation: true
    validates :password_confirmation, presence: true, on: :create
  end
  