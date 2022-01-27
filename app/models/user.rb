class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: %i[facebook]

  #has_many :friend_requests_as_requestor,
    #foreign_key: :requestor_id,
    #class_name: :FriendRequest 

  #has_many :friend_requests_as_receiver,
    #foreign_key: :receiver_id,
    #class_name: :FriendRequest

  #has_many :friends_lists, ->(user) { where("friend_a_id = ? OR friend_b_id = ?", user.id, user.id) }

  #has_many :friends, through: :friends_lists

  has_many :posts

  #has_many :friend_requests, dependent: :destroy
  #has_many :pending_friends, through: :friend_requests, source: :friend

  #has_many :friendships, dependent: :destroy
  #has_many :friends, through: :friendships

  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships, :source => :user
  has_many :friendsPosts, :through => :friends, :source => :posts

  has_many :friend_requests, :dependent => :destroy
  has_many :receivers, :through => :friend_requests, :source => :user
  #has_many :requestors, :through => :friend_requests, :source => "requestor_id"


  #belongs_to :user, :foreign_key => :requestor_id
  #belongs_to :user, :foreign_key => :receiver_id

  #t.integer "requestor_id"
  #    t.integer "receiver_id"

  
  has_many :liked_posts
  has_many :favourites, through: :liked_posts, source: :post

  has_many :comments
  has_many :liked_comments
  has_many :Cfavourites, through: :liked_comments, source: :comment

  def allPosts
    (posts.all+friendsPosts.all)
  end

  has_one_attached :avatar

  
end
