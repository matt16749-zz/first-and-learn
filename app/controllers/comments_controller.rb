class CommentsController < ApplicationController
  before_action :commentable

  def index
    @comments = @commentable.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    redirect_to user_session_path unless user_signed_in?
    @comment = Comment.new
  end

  def create
    redirect_to user_session_path and return unless user_signed_in?
    comment = @commentable.comments.build(comment_params)
    comment.user_id = current_user.id
    if comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to polymorphic_path(@commentable)
    else
      render :action => 'new'
    end
  end

  def destroy
    redirect_to user_session_path and return unless user_signed_in?
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_to polymorphic_path(@commentable)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:id, :body, :user_id, :commentable_type, :commentable_id)
  end

  def commentable
    @commentable = find_commentable
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
