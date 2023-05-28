module PostsHelper
    def like_button (post, user)
        if Like.where(post_id: post.id).where(user_id: user.id).exists?
            like = Like.where(post_id: post.id).where(user_id: user.id).first
            button_to 'Unlike', post_like_path(post.id, like.id), method: :delete
        else
            button_to 'Like', post_likes_path(post, like: {user_id: user.id, post_id: post.id })
        end
    end

end
