class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.create(trip_params)
        @post.user = User.find_by(id: session[:user_id])
        @post.trip = Trip.find(params[:id])
        if @post.save
            redirect_to post_path(@path)
        else
            render :new
            @post.errors.full_messages.each do |msg|
                puts msg
            end
        end
    end

    def show
        @post = Post.find(params[:id])
    end

private

    def trip_params
        params.require(:post).permit(:name, :body)
    end

end
