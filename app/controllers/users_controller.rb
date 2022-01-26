class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:new, :create]

    def index
        @users=User.where(name: params[:name])
    end

    def show
        @user=User.find(params[:id])
        @posts=@user.posts
        @post=Post.new
    end

    def forgotPass
        @user=current_user
        UserMailer.with(user: @user).forgot_password.deliver_later
    end


end
