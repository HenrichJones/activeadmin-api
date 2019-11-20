class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :username, :email

  belongs_to :address
end