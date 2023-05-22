class Post < ApplicationRecord
  belongs_to :user
  
  has_many :likes
  has_many :comments, dependent: :destroy

  scope :friend_filter, -> (friendship_ids) {where(user_id: friendship_ids)}
  # the code above uses the SQL "IN" clause i.e. user_id IN the friendship_ids array
end