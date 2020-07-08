class User < ApplicationRecord
    has_many :favorite_meals
    has_many :meals, through: :favorite_meals

    has_many :reviews #, class_name: "Review"
    has_many :meals_reviewed, through: :reviews, source: :meal

    has_secure_password
    
    validates :name, :password, :password_confirmation, presence: true
    validates :name, uniqueness: true
    
end
