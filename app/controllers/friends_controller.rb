class FriendsController < ApplicationController
  def index
    @friends=current_user.friends.all
  end

  def create
    @friendship=current_user.friendships.build(friend_id: params[:id])

    respond_to do |format|
      if @friendship.save
          #UserMailer.with(user: current_user).welcome_email.deliver_later
        format.html { redirect_to root_path, notice: "Friendship was successfully created." }
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
