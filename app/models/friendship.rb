class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, class_name: "User"

    scope :current_user_friends, -> (id) {where(user_id: id).or(where(friend_id: id))}
end
