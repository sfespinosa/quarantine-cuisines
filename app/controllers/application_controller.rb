class ApplicationController < ActionController::Base
    helper_method :current_user, :redirect_user, :logged_in?
    
    # before_action :current_user
    # def index
    #     user = User.find(session[:user_id])
    #     if user
    #         redirect_to user_path
    #     else
    #         flash[:message] = "Please login to view favorites"
    #         redirect_to login_path
    #     end
    # end
    def logged_in?
        !!current_user
    end

    def current_user
        @user = User.find(session[:user_id]) if session[:user_id]
    end

    def redirect_user
        if !current_user
            flash[:message] = "Please login to view"
            redirect_to login_path
        end
    end
end
