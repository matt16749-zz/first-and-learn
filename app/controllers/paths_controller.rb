class PathsController < ApplicationController
  def index
    @paths = Path.all
  end

  def new
    @path = Path.new
  end

private
  def path_params
    params.require(:path).permit(:title, :description, :user_id)
  end
end
