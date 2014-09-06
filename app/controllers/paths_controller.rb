class PathsController < ApplicationController
  def index
    @paths = Path.all
  end

  def new
    @paths = Path.all
    @path = Path.new
    render :index
  end

  def create
    path = Path.new(path_params)
    if current_user
      current_user.paths << path
    end
    redirect_to paths_path
  end

private
  def path_params
    params.require(:path).permit(:title, :description, :user_id)
  end
end
