class PostsController < ApplicationController
    before_action :authenticate_user!#, except: [:index]

    def index
        #@posts=current_user.friends.posts.all
        #@posts=current_user.posts.all#.and(current_user.friendsPosts.all)
        #@posts2=current_user.friendsPosts.all
        @posts=current_user.allPosts.sort_by(&:"#{'created_at'}").reverse.uniq
        #@posts<<@posts2
        
        @post=Post.new
        @notifications=FriendRequest.where(receiver_id:current_user.id)
        
    end

    def like
        @post=Post.find(params[:id])
        @post.likes<<current_user unless @post.likes.ids.include?(current_user.id)
        redirect_to root_path(anchor: "post_"+params[:id]) unless @post.likes.ids.include?(current_user.id)
    end

    def show
        @post=Post.find(params[:id])
    end

    def new 
        @post=Post.new
    end

    def post_newForm
        @post=Post.new
        render partial: "newPost"
    end
    
    def create
        @post=current_user.posts.build(post_params)
        respond_to do |format|
            if @post.save
                #UserMailer.with(user: current_user).welcome_email.deliver_later
              format.html { redirect_to root_path, notice: "Post was successfully created." }
              format.json { render :show, status: :created, location: @post }
            else
              format.html { redirect_to root_path, status: :unprocessable_entity }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @post=Post.find(params[:id])
        respond_to do |format|
            if @post.delete
                #UserMailer.with(user: current_user).welcome_email.deliver_later
              format.html { redirect_to root_path, notice: "Post was successfully deleted." }
              format.json { render :show, status: :created, location: @post }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end
    private

    def post_params
        params.require(:post).permit(:body, :picture)
    end
end
