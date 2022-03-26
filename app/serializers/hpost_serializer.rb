class HpostSerializer < ActiveModel::Serializer
  attributes :id, :title, :h_request, :user_id
  has_one :user
end
