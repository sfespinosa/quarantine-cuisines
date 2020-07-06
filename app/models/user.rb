class User < ApplicationRecord
    has_many :favorite_meals
    has_many :meals, through: :favorite_meals
end
