class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    @users = User.search(search_params[:username])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def search_params
    params.require(:search).permit(:username)
  end
end
