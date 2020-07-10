class MealsController < ApplicationController
    before_action :current_user, only: [:favorite, :show, :index]
    before_action :redirect_user, only: [:favorite]
   
    def index 
        @meals = Meal.search(params[:search])
    end

    def show
        @meal = Meal.find(params[:id])
        @review = Review.new
    end

    def favorite 
        @meal = Meal.find(params[:id])
        type = params[:type]
        if type == "favorite"
            current_user.meals << @meal
            redirect_back(fallback_location: meals_path)
        elsif type == "unfavorite"
            current_user.meals.delete(@meal)
            redirect_back(fallback_location: meals_path)
        else
            redirect_to meal_path
        end
    end

    
end
