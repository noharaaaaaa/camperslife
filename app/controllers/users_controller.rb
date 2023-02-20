class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #@nickname = current_user.nickname
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :last_name, :first_name, :email, :profile_image)
  end

end
