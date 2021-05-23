class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  validates :title, precense: true
  validates :content, precense: true, length: { maximum: 300, minimum: 2 }
end
