class ReviewsController < ApplicationController
    before_action :current_user, only: [:new, :create]
    before_action :redirect_user, only: [:new, :create]
    
    def new
        @meal = Meal.find(params[:id])
        @review = Review.new
    end

    def create

        @review = Review.new(review_params)
        if @review.save
            redirect_to meal_path(@meal)
        else
            flash[:message] = @review.errors.full_messages
            render :new
        end
    end

    private 
        def review_params
            params.require(:review).permit(:comment, :stars, :user_id, :meal_id)
        end
end
