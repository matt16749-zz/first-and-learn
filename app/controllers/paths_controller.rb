class PathsController < ApplicationController
  def index
    @path = Path.all
  end
end
