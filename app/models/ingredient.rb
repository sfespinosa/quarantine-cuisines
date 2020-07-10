class Ingredient < ApplicationRecord
    has_many :recipes
    has_many :meals, through: :recipes

    def self.search(search)
        if search && search != ""
            ingredient_type = Ingredient.where("name LIKE ?", "%#{search}%")
        else
            @ingredients = Ingredient.all
        end
    end
end
