class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :token

  has_many :tasks

  link(:self) { user_url(object) }
end
