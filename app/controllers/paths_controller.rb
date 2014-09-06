class PathsController < ApplicationController
  def index
    @paths = Path.all
  end

  def new
    @paths = Path.all
    @path = Path.new
    render :index
  end

private
  def path_params
    params.require(:path).permit(:title, :description, :user_id)
  end
end
