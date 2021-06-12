class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  validates :title, presence: true, length: { maximun: 20, minimum: 1}
  validates :content, presence: true, length: { maximum: 300, minimum: 2 }
end
