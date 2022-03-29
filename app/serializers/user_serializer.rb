class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone, :city, :profile_url,
  :hposts, :gposts
end
# include: [ , :gposts]

# end
