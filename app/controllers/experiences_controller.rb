class ExperiencesController < ApplicationController

    def start
        if logged_in?
            redirect_to '/home'
        else
            render layout: "landing"
        end
    end

    def index
        require_logged_in
        @user = User.find_by(id: session[:user_id])
    end
end
