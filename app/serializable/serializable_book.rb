class SerializableBook < JSONAPI::Serializable::Resource
  type 'books'

  attributes :title, :description, :author, :price, :featured,
             :avaiable_on, :image_file_name, :created_at, :updated_at

end