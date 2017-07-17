class UsersController < ApplicationController
  def show
    @user = User.find_by(username: user_params[:username])
    @slides = @user.slides
  end

  private
  def user_params
    params.permit(:username)
  end
end
