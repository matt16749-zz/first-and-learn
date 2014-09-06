class AssetsController < ApplicationController


  private
  def asset_params
    params.require(:asset).permit(:title, :description, :url)
  end
end
