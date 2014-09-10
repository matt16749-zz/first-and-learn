class PathsController < ApplicationController
  include ApplicationHelper
  before_action :redirect_to_sign_up, only: [:new, :create, :update, :edit, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @paths = Path.all
  end

  def new
    @path = Path.new
  end

  def create
    tags_to_add = remove_tags_from_params![:tags].split(/,\s*/)
    path = Path.new(path_params.merge(user_id: current_user.id))
    if path.save
      tags_to_add.each { |tag| path.tags << Tag.find_by_name(tag) }
      redirect_to path_path(path)
    else
      render :new
    end
  end

  def edit
    @path = Path.find(params[:id])
  end

  def update
    path = Path.find(params[:id])
    path.update(path_params)
    if path.save
      redirect_to paths_path
    else
      render :edit
    end
  end

  def show
    @path = Path.find(params[:id])
    @votes_count = vote_count(params[:id], 'Path')
  end

  def destroy
    Path.find(params[:id]).destroy
    redirect_to paths_path
  end

private
  def path_params
    params.require(:path).permit(:title, :description, :user_id)
  end

  def tags_params
    params.require(:path).permit(:tags)
  end

  def check_owner
    unless Path.find(params[:id]).user_id == current_user.id
      flash[:alert] = "You cannot edit or destroy a path you do not own!"
      redirect_to paths_path and return
    end
  end

  def remove_tags_from_params!
    tags_params.extract!(:tags)
  end
end
