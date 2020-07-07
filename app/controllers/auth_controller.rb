class AuthController < ApplicationController
    def login

    end

    def verify_username
        @user = User.find_by(name: params[:auth][:name])
        if @user 
            redirect_to meals_path
        else
            flash[:message] = "Please enter the right credentials."
            render :login
        end
    end
end