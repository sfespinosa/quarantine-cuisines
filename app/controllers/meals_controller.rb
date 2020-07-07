class MealsController < ApplicationController
    before_action :current_user, only: [:favorite]
    before_action :redirect_user, only: [:favorite]

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
            redirect_to meal_path, notice: 'Meal Added To Favorites!'
        elsif type == "unfavorite"
            current_user.meals.delete(@meal)
            redirect_to meal_path, notice: 'Meal Deleted From Favorites!'
        else
            redirect_to meal_path
        end

        def category
            
        end
    end
end
