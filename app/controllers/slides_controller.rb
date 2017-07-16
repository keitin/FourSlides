class SlidesController < ApplicationController
  def index
  end

  def new
    @slide = Slide.new
  end

  def create
    Slide.create(slide_params)
    redirect_to :root
  end

  private
  def slide_params
    params.require(:slide).permit(:title, :summary)
  end
end
