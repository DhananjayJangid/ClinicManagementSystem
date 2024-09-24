class ApplicationController < ActionController::Base
    before_action :current_user
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def require_login
      unless @current_user
        redirect_to login_path, alert: "You must log in to access this page."
      end
    end
  end
  