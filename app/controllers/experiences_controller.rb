class ExperiencesController < ApplicationController
    def index
        require_logged_in
        @user = User.find_by(id: session[:user_id])
    end
end
