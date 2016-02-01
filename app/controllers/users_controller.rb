class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path, :flash => { notice: "Successfully signed up" }
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :full_name,
      :email,
      :username,
      :password,
      :bio
    )
  end
end
