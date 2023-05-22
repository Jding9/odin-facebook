class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :incoming_requests, class_name: 'FriendRequest', foreign_key: "receiver_id"
  has_many :outgoing_requests, class_name: 'FriendRequest', foreign_key: "requestor_id"

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :posts
  has_many :comments, :through => :posts

  has_many :likes
  has_many :liked_posts, :through => :likes;
end
