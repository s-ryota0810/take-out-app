class UserSerializer < ActiveModel::Serializer
  attributes :id, :display_name
  
  def display_name
    if object.name.present?
      return object.name
    else
      return '名無しさん'
    end
  end

end
