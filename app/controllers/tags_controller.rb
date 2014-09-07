class TagsController < ApplicationController
  before_action :redirect_to_sign_up, only: [:new, :create]
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tags_params)
    render :new
  end

  private
  def tags_params
    params.require(:tag).permit(:name)
  end

  def redirect_to_sign_up
    redirect_to new_user_session_path and return unless user_signed_in?
  end
end
