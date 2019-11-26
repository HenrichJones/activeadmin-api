class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :username, :email, :created_at, :updated_at

  has_many :address do
    meta do
      @object.addresses
    end
  end
end