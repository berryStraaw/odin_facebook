class CommentsController < ApplicationController
  def index
    #post=Post.find(params[:post_id])
    #@comments=post.comments.all
  end

  def new
    @comment=Comment.new
  end

  def like
    @comment=Comment.find(params[:id])
    @comment.likes<<current_user unless @comment.likes.ids.include?(current_user.id)
    redirect_to root_path(anchor: "comment_"+params[:id]) unless @comment.likes.ids.include?(current_user.id)
  end


  def create
    #post=Post.find(params[:post_id])
    @post = Post.find(params[:post_id])
    @comment=@post.comments.build(comment_params)
    @comment.user_id=current_user.id
    respond_to do |format|
        if @comment.save
            #UserMailer.with(user: current_user).welcome_email.deliver_later
          format.html { redirect_to root_path, notice: "Comment was successfully created." }
          format.json { render :show, status: :created, location: @comment }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
    end
  end

  private

  def comment_params
      params.require(:comment).permit(:body)
  end

end
