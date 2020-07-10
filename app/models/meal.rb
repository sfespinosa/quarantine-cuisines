class Meal < ApplicationRecord
    has_many :recipes
    has_many :ingredients, through: :recipes

    has_many :favorite_meals
    has_many :users, through: :favorite_meals

    has_many :reviews
    has_many :reviewers, through: :reviews, source: :user

    def read_instructions
        self.instructions.split(/[\r\n]+/)
    end

    def average_rating
        sum_stars = self.reviews.sum do |review|
            review.stars  
        end
        avg = sum_stars.to_f / reviews.count
        avg.round(2)
    end

    def self.search(search)
        if search
            meal_type = Meal.where(name: search.titleize)
        else
            @meals = Meal.all
        end
    end
end
