# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'JSON'

Ingredient.destroy_all
Meal.destroy_all
Recipe.destroy_all

ingredient_data = RestClient.get("https://www.themealdb.com/api/json/v1/1/list.php?i=list")
ingredients = JSON.parse(ingredient_data)

ingredients["meals"].map do |ingredient|
    Ingredient.create(name: ingredient["strIngredient"], description: ingredient["strDescription"])
end

meal_data = RestClient.get("https://www.themealdb.com/api/json/v1/1/search.php?s=")
meals = JSON.parse(meal_data)

meals["meals"].map do |meal|
    Meal.create(name: meal["strMeal"], area: meal["strArea"], category: meal["strCategory"], instructions: meal["strInstructions"], image_url: meal["strMealThumb"], source: meal["strSource"])
end

meals["meals"].map do |meal|
    n = 1
    while n < 21
        if meal["strIngredient#{n}"]
            Recipe.create(ingredient: Ingredient.find_by(name: meal["strIngredient#{n}"]), meal: Meal.find_by(name: meal["strMeal"]), measurements: meal["strMeasure#{n}"])
        end
        n += 1
    end
end

puts "Seeds done!"