class StepsController < ApplicationController
  before_action :redirect_to_sign_up, only: [:new, :create, :edit, :update, :destroy]

  def new
    @step = Step.new
    @path = Path.find(params[:path_id])
    @assets = Asset.where('user_id = ?', current_user.id)
  end

  def create
    step = Step.new(steps_params)
    step.update_attributes(asset_id: params[:asset][:asset_id], path_id: params[:path_id])
    step.get_position

    if step.save
      redirect_to path_path params[:path_id]
    else
      render :new
    end
  end

  def show
    @step = Step.find(params[:id])
  end

  def edit
    @step = Step.find(params[:id])
    @path = Path.find(params[:path_id])
    @assets = Asset.where("user_id = ?", current_user.id)
  end

  private
  def steps_params
    params.require(:step).permit(:body, :position)
  end

  def redirect_to_sign_up
    redirect_to new_user_session_path and return unless user_signed_in?
  end
end
