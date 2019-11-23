class SerializableUser < JSONAPI::Serializable::Resource
  attributes :username, :email, :password

  belongs_to :address
end