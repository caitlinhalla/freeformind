class AddUserIdToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :user_id, :integer
    remove_column :products, :price
    add_column :products, :price, :string
  end
end
