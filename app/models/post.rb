class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :picture
    has_many :liked_posts , :dependent => :destroy
    has_many :likes, through: :liked_posts, source: :user , :dependent => :destroy
    validates :body, presence: true
    has_many :comments , :dependent => :destroy
end
