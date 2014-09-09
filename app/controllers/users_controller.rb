class UsersController < ApplicationController
  # ==============================================================
  # ===== Do I need to include before actions for users??? =======
  # ==============================================================
  include ApplicationHellper
  before_action :redirect_to_sign_up, only: [:new, :create, :update, :edit, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]



  def index
    @users = User.all
  end

  def new
    @user = User.new  # don't know if this is necessary but wanted to include it for good measure
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      redirect_to users_path
    else
      render :edit
    end
  end

  def show
    @user = Path.find(params[:id])
  end


private
  def user_params
    params.require(:path).permit(:description)
  end

end