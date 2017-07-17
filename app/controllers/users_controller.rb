class UsersController < ApplicationController
  def show
    @slides = current_user.slides
  end
end
