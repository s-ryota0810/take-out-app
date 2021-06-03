class Shop < ApplicationRecord
  validates :name, presence: true
  has_many_attached :images
  has_many :menus, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  geocoded_by :address
  after_validation :geocode
  belongs_to :genre

  def shop_image
    if self.images.attached?
      self.images[0]
    else
      'no-images.jpeg'
    end
  end
end
