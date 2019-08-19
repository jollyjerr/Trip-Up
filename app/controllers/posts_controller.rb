class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        @post.user_id = User.find_by(id: session[:user_id]).id
        if @post.save
            redirect_to trip_path(@post.trip_id)
        else
            @post.errors.full_messages.each do |msg|
                puts msg
            end
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def destroy
        id = Post.find_by(id: params[:id]).trip_id
        Post.find_by(id: params[:id]).destroy
        redirect_to trip_path(id)
    end

private

    def post_params
        params.permit(:name, :body, :trip_id)
    end

end
