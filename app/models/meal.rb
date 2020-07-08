class Meal < ApplicationRecord
    has_many :recipes
    has_many :ingredients, through: :recipes

    has_many :favorite_meals
    has_many :users, through: :favorite_meals

    has_many :reviews #class_name: "Review" # foreign_key: :meal_id
    has_many :reviewers, through: :reviews, source: :user

    def read_instructions
        self.instructions.split(/[\r\n]+/)
    end

    def self.collect_categories
        self.all.collect do |meal|
            meal.category
        end 
    end
end
