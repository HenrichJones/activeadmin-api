class SerializableAddress < JSONAPI::Serializable::Resource
  type 'addresses'

  attributes :street, :neigborhood, :city, :state, :zipcode, :created_at, :updated_at

  belongs_to :user do
    meta do
      @object.user
    end
  end
end