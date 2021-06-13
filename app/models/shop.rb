class Shop < ApplicationRecord
  validates :name, presence: true
  has_many_attached :images
  has_many :menus, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  geocoded_by :address
  after_validation :geocode
  belongs_to :genre
  belongs_to :area

  def shop_image
    if self.images.attached?
      self.images[0]
    else
      'no-images.jpeg'
    end
  end

  def weekday_opening
    if self.weekday_opentime && self.weekday_closetime
      open = self.weekday_opentime.strftime('%H:%M')
      close = self.weekday_closetime.strftime('%H:%M')
      return "#{open} ~ #{close}"
    else
      return '不明'
    end
  end

  def weekend_opening
    if self.weekend_opentime && self.weekend_closetime
      open = self.weekend_opentime.strftime('%H:%M')
      close = self.weekend_closetime.strftime('%H:%M')
      return "#{open} ~ #{close}"
    else
      return '不明'
    end
  end

end
