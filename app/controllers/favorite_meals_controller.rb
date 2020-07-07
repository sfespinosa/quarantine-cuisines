class FavoriteMealsController < ApplicationController
    def new
        @favorite_meal = FavoriteMeal.new
    end

    def create
        @favorite_meal = FavoriteMeal.new(favorite_meal_params)
        if @favorite_meal.save
            redirect_to user_path
        else
            
            render :new
        end
    end

    private
        def favorite_meal_params
            params.require(:favorite_meal).permit(:meal_ids, :user_ids)
        end 
end
