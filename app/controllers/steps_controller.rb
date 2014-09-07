class StepsController < ApplicationController

  def new
    redirect_to new_path_step_path unless user_signed_in?
    @step = Step.new
    @path = Path.find(params[:path_id])
    @assets = Asset.where('user_id = ?', current_user.id)
  end

  def create
    redirect_to new_path_step_path and return unless user_signed_in?
    step = Step.new(steps_params)
    step.update_attributes(asset_id: params['<option value='], path_id: params[:path_id])
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
    redirect_to new_user_session_path unless user_signed_in?
    @step = Step.find(params[:id])
    @path = Path.find(params[:path_id])
    @assets = Asset.where("user_id = ?", current_user.id)
  end

  private
  def steps_params
    params.require(:step).permit(:body, :position)
  end
end
