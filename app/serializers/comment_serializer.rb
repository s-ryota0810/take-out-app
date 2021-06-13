class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :star
  belongs_to :user

end
