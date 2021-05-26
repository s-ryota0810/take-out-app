class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  
  def has_favorited?(shop)
    self.favorites.exists?(shop_id: shop.id)
  end
  
  def display_name
    if self.name.present?
      self.name
    else
      '名無しさん'
    end
  end
end
