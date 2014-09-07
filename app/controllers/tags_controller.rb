class TagsController < ApplicationController
  include ApplicationHelper
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
end
