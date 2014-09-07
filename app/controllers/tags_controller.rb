class TagsController < ApplicationController
  def new
    redirect_to user_session_path unless user_signed_in?
    @tag = Tag.new
  end

  def create
    redirect_to user_session_path unless user_signed_in?
    @tag = Tag.create(tags_params)
    render :new
  end
  private
  def tags_params
    params.require(:tag).permit(:name)
  end

end