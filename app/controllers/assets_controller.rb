class AssetsController < ApplicationController
  def index
    @assets = Asset.all
  end

  def new
    redirect_to user_session_path unless user_signed_in?
    @asset = Asset.new
  end

  end

  private
  def asset_params
    params.require(:asset).permit(:title, :description, :url)
  end
end
