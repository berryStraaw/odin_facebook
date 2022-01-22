class FriendRequest < ApplicationRecord
  belongs_to :user, :foreign_key => :requestor_id
  belongs_to :user, :foreign_key => :receiver_id
end
