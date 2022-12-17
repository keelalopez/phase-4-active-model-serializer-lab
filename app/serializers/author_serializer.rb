class AuthorSerializer < ActiveModel::Serializer
  attributes :name

  has_one :profile, serializer: AuthorProfileSerializer
  has_many :posts
  # has_many :tags
end
