class Slide < ActiveRecord::Base

  has_many :images, dependent: :destroy
  belongs_to :user

  validates :title, presence: true

  def self.is_images_not_enough?(params)    
    return true if params[:images].nil?
    return true if params[:images].count < 4
    return false
  end

  def self.is_title_unique?(slide, current_user)
    return current_user.slides.find_by(title: slide.title).nil?
  end
end
