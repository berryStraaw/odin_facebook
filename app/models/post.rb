class Post < ApplicationRecord
    belongs_to :user
    
    has_many :liked_posts
    has_many :likes, through: :liked_posts, source: :user

    has_many :comments
end
