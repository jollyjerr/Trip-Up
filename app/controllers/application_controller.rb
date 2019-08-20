class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
before_action :current_user
helper_method :current_user, :logged_in?

    def current_user
        @user = (User.find_by(id: session[:user_id]) || User.new)
    end

    def logged_in?
        current_user.id != nil
    end

    def require_logged_in
        if logged_in?
        else
            redirect_to(
                controller: 'sessions',
                action: 'new'
            )
        end
    end
end

