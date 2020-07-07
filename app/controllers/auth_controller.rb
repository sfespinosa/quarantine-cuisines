class AuthController < ApplicationController
    def login

    end

    def verify_username
        @user = User.find_by(name: params[:auth][:name])
        if @user
            session[:user_id] = @user.id
            redirect_to meals_path
        else
            flash[:message] = "Please enter the right credentials."
            render :login
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end

end