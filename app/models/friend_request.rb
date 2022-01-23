class FriendRequest < ApplicationRecord
    #belongs_to :user, :foreign_key => :requestor_id
    belongs_to :user, :foreign_key => :receiver_id

    #u1.friend_requests.build(receiver_id: 2).save
end
