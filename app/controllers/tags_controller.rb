class TagsController < ApplicationController
  def new
    redirect_to user_session_path unless user_signed_in?
    @tag = Tag.new
  end

  def create
    redirect_to user_session_path unless user_signed_in?
    @tag = Tag.create(params[:tag])
  end
end