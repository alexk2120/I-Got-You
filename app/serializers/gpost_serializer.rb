class GpostSerializer < ActiveModel::Serializer
  attributes :id, :comment, :likes
  has_one :user
end
