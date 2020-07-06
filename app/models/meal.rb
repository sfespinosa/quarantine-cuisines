class Meal < ApplicationRecord
    has_many :recipes
    has_many :ingredients, through: :recipes

    has_many :favorite_meals
    has_many :users, through: :favorite_meals
end
