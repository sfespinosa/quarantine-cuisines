class AuthController < ApplicationController
    def login
    end

    def verify_username
        @user = User.find_by(name: params[:auth][:name])
        if @user && @user.authenticate(params[:auth][:password])
            session[:user_id] = @user.id
            redirect_to meals_path
        else
            flash[:message] = "Please enter the right credentials."
            render :login
        end
    end

    def logout
        session.clear
        flash[:message] = "You've logged out! Come back soon!"
        redirect_to login_path
    end

end