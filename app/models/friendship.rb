class Friendship < ApplicationRecord
  #after_create :create_inverse_relationship
  #after_destroy :destroy_inverse_relationship

  #belongs_to :user
  #belongs_to :friend, class_name: 'User'

  #private

  #def create_inverse_relationship
  #  friend.friendships.create(friend: user)
  #end

  #def destroy_inverse_relationship
  #  friendship = friend.friendships.find_by(friend: user)
  #  friendship.destroy if friendship
  #end

  belongs_to :user, :foreign_key => :friend_id
  #after_create do |p|
  #  Friendship.create(user_id: p.friend_id, friend_id: p.user_id)
  #end
  after_create  { Friendship.find_or_create_by(user_id: friend_id, friend_id: user_id) }
  #after_destroy {Friendship.find(user_id: friend_id)}
  #after_create do |p|
  #  if Friendship.find(:friend_id == p.user_id)
  #    Friendship.create!(user_id: p.friend_id, friend_id: p.user_id)
  #  end
  #end

  after_destroy do |p|
    reciprocal = Friendship.find_by_user_id_and_friend_id(p.friend_id,p.user_id)
    reciprocal.destroy unless reciprocal.nil?
  end

  # u1.friendships.build(friend_id: u2.id).save
  # friendship.first.destroy
end
