class PathsController < ApplicationController
  def index
    @paths = Path.all
  end

  def new
    redirect_to user_session_path unless user_signed_in?
    @path = Path.new
  end

  def create
    redirect_to user_session_path and return unless user_signed_in?
    path = Path.new(path_params)
    current_user.paths << path
    redirect_to paths_path
  end

  def edit
    redirect_to user_session_path unless user_signed_in?
    path = Path.find(params[:id])
    @path = path
  end

  def update
    redirect_to user_session_path and return unless user_signed_in?
    path = Path.find(params[:id])
    path.update_attributes(path_params)
    path.save
    redirect_to paths_path
  end

  def show
    @path = Path.find(params[:id])
  end

  def destroy
    redirect_to user_session_path and return unless user_signed_in?
    path = Path.find(params[:id])
    path.destroy
    redirect_to paths_path
  end

private
  def path_params
    params.require(:path).permit(:title, :description, :user_id)
  end
end
