class FriendsController < ApplicationController
  def index
    @friends=current_user.friends.all
    fr=FriendRequest.where(receiver_id:current_user.id)
    @friend_requests=[]
    fr.each do |request|
      @friend_requests<< @user=User.find(request.user_id)
    end
    #@friend_requests=current_user.receivers
  end

  def create_request
    @friend_request=current_user.friend_requests.build(receiver_id: params[:id])
    respond_to do |format|
      if @friend_request.save
          #UserMailer.with(user: current_user).welcome_email.deliver_later
        format.html { redirect_to root_path, notice: "Friend request sent" }
        format.json { render :show, status: :created, location: @friend_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept_request
    if FriendRequest.find_by_user_id_and_receiver_id(params[:id],current_user.id)
      delete_request
      create
    end
  end

  private
  def delete_request
    FriendRequest.find_by_user_id_and_receiver_id(params[:id],current_user.id).destroy
  end
  def create
    @friendship=current_user.friendships.build(friend_id: params[:id])

    respond_to do |format|
      if @friendship.save
          #UserMailer.with(user: current_user).welcome_email.deliver_later
        format.html { redirect_to friends_path, notice: "Friendship was successfully created." }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
  end
end
