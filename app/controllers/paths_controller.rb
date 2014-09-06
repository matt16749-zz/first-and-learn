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

  def edit
    path = Path.find(params[:id])
    @paths = Path.all
    if current_user
      @path = path
    end
    render :index
  end

  def update
    path = Path.find(params[:id])
    path.update_attributes(path_params)
    path.save
    redirect_to paths_path
  end

  def show
    @path = Path.find(params[:id])
  end

  def destroy
    path = Path.find(params[:id])
    path.destroy
    redirect_to paths_path
  end

private
  def path_params
    params.require(:path).permit(:title, :description, :user_id)
  end
end
