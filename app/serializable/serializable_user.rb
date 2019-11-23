class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :username, :email, :password

  belongs_to :address
end