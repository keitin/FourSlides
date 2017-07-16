class Image < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  belongs_to :slide

  def self.create_with(images_params, slide)
    # TODO: Bulk insert
    images_params.each_with_index do |image, i|
      Image.create(image: image, order: i + 1, slide_id: slide.id)
    end
  end
end
