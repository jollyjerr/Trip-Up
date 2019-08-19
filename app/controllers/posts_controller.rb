class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        @post.user_id = User.find_by(id: session[:user_id])
        if @post.save
            redirect_to post_path(@path)
        else
            @post.errors.full_messages.each do |msg|
                puts msg
            end
        end
    end

    def show
        @post = Post.find(params[:id])
    end

private

    def post_params
        params.require(:post).permit(:name, :body, :trip_id)
    end

end
