class AssetsController < ApplicationController
  include ApplicationHelper
  before_action :redirect_to_sign_up
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @assets = Asset.where("user_id = ?", current_user.id)
  end

  def show
    @asset = Asset.find(params[:id])
  end

  def new
    @asset = Asset.new
  end

  def create
    asset = Asset.new(asset_params)
    asset.user_id = current_user.id
    if asset.save
      redirect_to assets_path
    else
      render :new
    end
  end

  def edit
    @asset = Asset.find(params[:id])
  end

  def update
    asset = Asset.find(params[:id])
    asset.update_attributes(asset_params)

    if asset.save
      redirect_to asset_path(asset)
    else
      render :edit
    end
  end

  def destroy
    asset = Asset.find(params[:id]).destroy
    redirect_to assets_path
  end

  private
  def asset_params
    params.require(:asset).permit(:title, :description, :url)
  end

  def check_owner
    unless Asset.find(params[:id]).user_id == current_user.id
      flash[:alert] = "You cannot edit or destroy an asset you do not own!"
      redirect_to paths_path and return
    end
  end
end
