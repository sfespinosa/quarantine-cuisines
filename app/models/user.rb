class User < ApplicationRecord
    has_many :favorite_meals
    has_many :meals, through: :favorite_meals
    has_secure_password
    
    validates :name, :password, :password_confirmation, presence: true
    validates :name, uniqueness: true
    
end
