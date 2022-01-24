class LikedPost < ApplicationRecord
    belongs_to :user
    belongs_to :post
    #User.favourites<<Post
    #Post.likes<<User
end
