class RegistrationsController < ApplicationController
  def sign_up
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save

      redirect_to root_path ,notice: 'ok' 
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password,:paddword_confirmation, :nickname)
  end
end