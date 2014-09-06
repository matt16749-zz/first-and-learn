class AssetsController < ApplicationController
  def index
    @assets = Asset.all
  end

  private
  def asset_params
    params.require(:asset).permit(:title, :description, :url)
  end
end
