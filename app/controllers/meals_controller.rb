class MealsController < ApplicationController
    before_action :current_user, only: [:favorite, :show, :index]
    before_action :redirect_user, only: [:favorite]
   
    def index 
        @meals = Meal.all
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
            redirect_back(fallback_location: meals_path, notice: 'Meal Added To Favorites!')
            # redirect_to meal_path, notice: 'Meal Added To Favorites!'
        elsif type == "unfavorite"
            current_user.meals.delete(@meal)
            redirect_to meal_path, notice: 'Meal Deleted From Favorites!'
        else
            redirect_to meal_path
        end
    end

    
end
