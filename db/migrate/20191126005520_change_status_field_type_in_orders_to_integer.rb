class ChangeStatusFieldTypeInOrdersToInteger < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :state
    add_column :orders, :state, :integer
  end
end
