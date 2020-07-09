class UsersController < ApplicationController
    before_action :current_user, only: [:confirm_current_user?]
    before_action :set_user, only: [:confirm_current_user?, :show]
    before_action :confirm_current_user?, only: [:show]

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to meals_path
        else
            flash[:message] = @user.errors.full_messages
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def confirm_current_user?
        return head(:forbidden) unless @user == current_user
    end
end
