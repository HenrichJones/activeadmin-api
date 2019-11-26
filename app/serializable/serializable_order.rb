class SerializableOrder < JSONAPI::Serializable::Resource
  type 'orders'

  attributes :state, :total, :created_at, :updated_at

  has_many :books do
    meta do
      @object.books
    end
  end
end