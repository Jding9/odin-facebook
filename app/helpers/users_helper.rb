module UsersHelper
    def check_relationship (user_id, current_user_id)
        friendships = Friendship.all
        friend_requests = FriendRequest.all
        if friendships.where(user_id: user_id, friend_id: current_user_id).exists?
            "Friend"
        elsif friendships.where(user_id: current_user_id, friend_id: user_id).exists?
            "Friend"
        elsif friend_requests.where(requestor_id: current_user_id, receiver_id: user_id).exists?
            "Outgoing Request"
        elsif friend_requests.where(requestor_id: user_id, receiver_id: current_user_id).exists?
            "Incoming Request"
        else
            "Error"
        end
    end
end
