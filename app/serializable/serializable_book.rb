class SerializableBook < JSONAPI::Serializable::Resource
  type 'books'

  attributes :title, :description, :author, :price, :featured,
             :avaiable_on, :image_file_name, :created_at, :updated_at

  has_many :oders do
    meta do
      @object.orders.order_by_created_at.take(5)
    end
  end

  attribute :total_sold do
    OrderBooks.find_by_book(@object.id).count
  end

  attribute :total_value do
    (@object.price.to_i * OrderBooks.find_by_book(@object.id).count)
  end
end