class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #@posts = @user.posts.page(params[:page]).reverse_order
  end

 

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_image)
  end

end
