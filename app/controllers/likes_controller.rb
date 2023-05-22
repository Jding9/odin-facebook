class LikesController < ApplicationController
    def new
        @like = Like.new
    end
    
    def create
        @post = Post.find(params[:post_id])
        @like = @post.likes.create(like_params)
        redirect_to posts_path
    end

    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        redirect_to posts_path
    end
end
