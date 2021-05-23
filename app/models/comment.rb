class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 300, minimum: 2 }
end
