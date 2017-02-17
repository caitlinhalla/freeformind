class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.column :author, :string
      t.column :content, :string
      t.column :rating, :integer
      t.column :user_id, :integer
      t.column :product_id, :integer

      t.timestamp
    end
  end
end
