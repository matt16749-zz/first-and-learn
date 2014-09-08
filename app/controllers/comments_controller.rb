class CommentsController < ApplicationController
  include ApplicationHelper
  before_action :commentable
  before_action :redirect_to_sign_up, only: [:new, :create, :destroy]
  before_action :check_owner, only: [:destroy]

  def index
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
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
    Comment.find(params[:id]).destroy
    redirect_to polymorphic_path(@commentable)
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

  def check_owner
    unless Comment.find(params[:id]).user_id == current_user.id
      flash[:alert] = "You cannot destroy a comment you do not own!"
      redirect_to paths_path and return
    end
  end
end
