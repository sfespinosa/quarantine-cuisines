class MealsController < ApplicationController

    def index 
        @meals = Meal.all
    end

    def show
        @meal = Meal.find(params[:id])
    end

    def favorite 
        @meal = Meal.find(params[:id])
        type = params[:type]
        if type == "favorite"
            current_user.meals << @meal
            redirect_to meal_path, notice: 'You favorited #{@meal.name}'
        elsif type == "unfavorite"
            current_user.meals.delete(@meal)
            redirect_to meal_path, notice: 'Unfavorited #{@meal.name}'
        else
            redirect_to meal_path
        end

        def category
            
        end
    end
end
