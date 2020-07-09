class ReviewsController < ApplicationController
    before_action :current_user, only: [:new, :create, :edit]
    before_action :redirect_user, only: [:new, :create, :edit]
    before_action :set_meal_review, only: [:edit, :update, :destroy]
    
    def new
        @meal = Meal.find(params[:id])
        @review = Review.new
    end

    def create
        @meal = Meal.find(params[:review][:meal_id])
        @review = Review.new(review_params)
        if @review.save
            redirect_to meal_path(@meal)
        else
            flash[:message] = @review.errors.full_messages
            redirect_back(fallback_location: meal_path(@meal))
        end
    end

    def update
        if @review.update(review_params)
            redirect_to meal_path(@meal)
        else 
            flash[:message] = @review.errors.full_messages
            render :edit
        end
    end

    def destroy
        @review.delete
        redirect_to meal_path(@meal)
    end

    private 
        def review_params
            params.require(:review).permit(:comment, :stars, :user_id, :meal_id)
        end

        def set_meal_review
            @review = Review.find(params[:id])
            @meal = @review.meal
        end
end
