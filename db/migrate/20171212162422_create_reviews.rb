class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.column :product_id, :integer
      t.column :user_id, :integer
      t.column :rating, :integer
      t.column :content, :text

      t.timestamps
    end
  end
end
