class AssetsController < ApplicationController
  def index
    @assets = Asset.all
  end

  def show
    @asset = Asset.find(params[:id])
  end

  def new
    redirect_to user_session_path unless user_signed_in?
    @asset = Asset.new
  end

  def create
    redirect_to user_session_path unless user_signed_in?

    asset = Asset.new(asset_params)
    asset.user_id = current_user.id
    if asset.save
      redirect_to assets_path
    else
      render :new
    end
  end

  def edit
    redirect_to user_session_path unless user_signed_in?
    @asset = Asset.find(params[:id])
  end

  def update
    redirect_to user_session_path unless user_signed_in?
    asset = Asset.find(params[:id])
    asset.update_attributes(asset_params)

    if asset.save
      redirect_to asset_path(asset)
    else
      render :edit
    end
  end

  private
  def asset_params
    params.require(:asset).permit(:title, :description, :url)
  end
end
