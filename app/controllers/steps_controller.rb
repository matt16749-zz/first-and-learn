class StepsController < ApplicationController

  def new
    redirect_to new_path_step_path unless user_signed_in?
    @step = Step.new
    @path = Path.find(params[:path_id])
    @assets = Asset.where('user_id = ?', current_user.id)
  end

  private
  def steps_params
    params.require(:step).permit(:body, :position)
  end
end
