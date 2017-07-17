class SlidesController < ApplicationController
  def index
    @slides = Slide.eager_load(:images)
  end

  def show
    @slide = Slide.find(slide_param[:id])
  end

  def new
    @slide = Slide.new
  end

  def create
    slide = Slide.create(slide_params)
    Image.create_with(images_params, slide)
    redirect_to :root
  end

  def preview
    @slide = Slide.find(slide_param[:id])
  end

  private
  def slide_param
    params.permit(:id)
  end

  def slide_params
    params.require(:slide).permit(:title, :summary).merge(user_id: current_user.id)
  end

  def images_params
    params.require(:images)
  end
end
