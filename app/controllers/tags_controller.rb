class TagsController < ApplicationController
  include ApplicationHelper
  before_action :redirect_to_sign_up, only: [:create]

  def create
    @tag = Tag.create(tags_params)
    render :new
  end

  private
  def tags_params
    params.require(:tag).permit(:name)
  end
end
