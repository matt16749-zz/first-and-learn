class CommentsController < ApplicationController

  def new
    path = Path.find(params[:path_id])
    asset = Asset.find(params[:])
  end


  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
