class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :username, :email, :created_at, :updated_at

  belongs_to :address
end