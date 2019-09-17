class Api::UsersController < ApplicationController

  def show
    render :show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      render :show
    else
      if User.pluck(:email).include?(@user.email)
        render json: ["Email has already been taken"], status: 422
      else
        render json: @user.errors.full_messages, status: 422
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end

end
