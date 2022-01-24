class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    has_many :liked_comments
    has_many :likes, through: :liked_comments, source: :user
    validates :body, presence: true
end
