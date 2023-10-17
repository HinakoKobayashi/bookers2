class UsersController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end
  
  
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end



end
