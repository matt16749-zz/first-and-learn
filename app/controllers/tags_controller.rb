class TagsController < ApplicationController
  include ApplicationHelper
  before_action :redirect_to_sign_up, only: [:create]

  def create
    all_tags = tags_params[:name].downcase.split(/,\s*/)
    tags_to_create = tags_that_need_to_be_created(all_tags)

    if params[:path_id]
      path = Path.find(params[:path_id])
      tags_to_create.each { |tag| path.tags << Tag.create(name: tag) }
    elsif params[:asset_id]
      asset = Path.find(params[:asset_id])
      tags_to_create.each { |tag| asset.tags << Tag.create(name: tag) }
    else
      tags_to_create.each { |tag| Tag.create(name: tag) }
    end

    render json: { tags: all_tags }
  end

  private
  def tags_params
    params.require(:tag).permit(:name)
  end

  def tags_that_need_to_be_created(tags_to_test)
    tags_to_test.select { |tag| Tag.find_by_name(tag).nil? }
  end
end
