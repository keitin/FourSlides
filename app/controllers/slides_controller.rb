class SlidesController < ApplicationController

  before_action :authenticate_user!, only: :new
  before_action :are_current_user?, only: [:edit, :update]

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
    if Slide.is_images_not_enough?(params)
      redirect_to :back, alert: '全ての画像をセットしてください'
      return
    end
    slide = Slide.new(slide_params)
    if !Slide.is_title_unique?(slide, current_user)
      redirect_to :back, alert: 'そのタイトルはすでに存在しています'
      return
    end
    if slide.save
      Image.create_with(images_params, slide)
      redirect_to :root
    else
      redirect_to :back, alert: 'タイトルをセットしてください'
    end
  end

  def edit
    @slide = Slide.find(slide_param[:id])
  end

  def update
    slide = Slide.find(slide_param[:id])
    slide.update(slide_params)
    Image.find(slide.images[0].id).update(image: images_params[:order_1]) if images_params[:order_1].present?
    Image.find(slide.images[1].id).update(image: images_params[:order_2]) if images_params[:order_2].present?
    Image.find(slide.images[2].id).update(image: images_params[:order_3]) if images_params[:order_3].present?
    Image.find(slide.images[3].id).update(image: images_params[:order_4]) if images_params[:order_4].present?
    redirect_to :root
  end

  def preview
    username = user_slide_params[:username]
    slide_title = user_slide_params[:title]
    @slide = User.find_by(username: username).slides.find_by(title: slide_title)
  end

  def destroy
    slide = Slide.find(slide_param[:id])
    slide.destroy
    redirect_to :root
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

  def user_slide_params
    params.permit(:username, :title)
  end

  def are_current_user?
    @slide = Slide.find(slide_param[:id])
    if @slide.user != current_user
      redirect_to :root
    end
  end
end
