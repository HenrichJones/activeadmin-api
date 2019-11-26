class CreateOrdersAndBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :state
      t.string :total

      t.timestamps
    end
 
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :author
      t.decimal :price, precision: 9, scale: 2
      t.boolean :featured
      t.datetime :avaiable_on
      t.string :image_file_name

      t.timestamps
    end
 
    create_table :order_books, id: false do |t|
      t.belongs_to :order
      t.belongs_to :book

      t.timestamps
    end
    add_reference :orders, :user, foreign_key: true, index: true
  end
end
