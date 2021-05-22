class Shop < ApplicationRecord
  validates :name, presence: true
  has_many_attached :images

  def shop_image
    if self.images.attached?
      self.images[0]
    else
      'no-images.jpeg'
    end
  end
end
