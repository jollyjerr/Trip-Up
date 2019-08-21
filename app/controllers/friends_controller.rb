class FriendsController < ApplicationController
    def index
        require_logged_in
        @user = current_user
        @friends = @user.friends
        @requests = @user.requested_friends
        @pending = @user.pending_friends
    end

    def create
        @user = current_user
        friend = User.find_by(id: params[:id])
        @user.friend_request(friend)

        redirect_to friends_path
    end
end
