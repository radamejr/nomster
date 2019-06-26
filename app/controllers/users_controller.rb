class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @user.update_attributes(users_params)
    
    if @user.valid?
      redirect_to user_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def users_params
    params.require(:user).permit(:profile_pic)
  end
end
