class CommentsController < ApplicationController
    before_action :get_post
    before_action :set_comment, only: [:show, :edit, :update, :delete]

    def index
        @comments = @post.comments
    end

    def new
        @comment = Comment.new
    end
    
    def edit
    end

    def create
        @comment = @post.comments.create(comment_params)
    end

    def update

    end

    def destroy
        @comment.destroy
    end

    private
        def comment_params
            params.require(:comment).permit(:body, :user_id)
        end

        def get_post
            @post = Post.find(params[:post_id])
        end

        def set_comment
            @comment = @post.comments.find(params[:id])
        end
end
