class PathsController < ApplicationController
  before_action :redirect_to_sign_up, only: [:new, :create, :update, :edit, :destroy]

  def index
    @paths = Path.all
  end

  def new
    @path = Path.new
  end

  def create
    path = Path.new(path_params)
    path.user_id = current_user.id
    if path.save
      redirect_to paths_path
    else
      render :new
    end
  end

  def edit
    @path = Path.find(params[:id])
  end

  def update
    path = Path.find(params[:id])
    path.update_attributes(path_params)
    if path.save
      redirect_to paths_path
    else
      render :edit
    end
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

  def redirect_to_sign_up
    redirect_to new_user_session_path and return unless user_signed_in?
  end
end
