class AssetsController < ApplicationController
  def index
    @assets = Asset.all
  end

  def new
    if user_signed_in?
      @asset = Asset.new
    else
      redirect_to user_session_path
    end
  end

  end

  private
  def asset_params
    params.require(:asset).permit(:title, :description, :url)
  end
end
