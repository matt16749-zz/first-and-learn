class StepsController < ApplicationController
  include ApplicationHelper
  before_action :redirect_to_sign_up, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_owner, only: [:new, :create, :edit, :update, :destroy]

  def new
    @step = Step.new
    @path = Path.find(params[:path_id])
    @assets = Asset.where(user_id: current_user.id)
  end

  def create
    step = Step.new(steps_params)
    step.update(asset_id: params[:asset][:asset_id], path_id: params[:path_id])
    step.get_position_and_update!

    if step.save
      redirect_to path_path params[:path_id]
    else
      @step = Step.new
      @path = Path.find(params[:path_id])
      @assets = Asset.where(user_id: current_user.id)
      render :new
    end
  end

  def show
    @step = Step.find(params[:id])
  end

  def edit
    @step = Step.find(params[:id])
    @path = Path.find(params[:path_id])
    @assets = Asset.where(user_id: current_user.id)
  end

  def update
    step = Step.find(params[:id])
    step.update_attributes(steps_params)
    step.asset_id = params[:asset][:asset_id]

    if step.save
      redirect_to path_path params[:path_id]
    else
      render :edit
    end
  end

  def destroy
    Step.find(params[:id]).destroy
    redirect_to path_path params[:path_id]
  end

  private
  def steps_params
    params.require(:step).permit(:body, :position)
  end

  def check_owner
    unless Path.find(params[:path_id]).user_id == current_user.id
      flash[:alert] = "You cannot create/edit/destroy a step of a path you do not own!"
      redirect_to paths_path and return
    end
  end
end
