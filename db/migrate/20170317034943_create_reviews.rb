class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.integer :user_id
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end

    add_reference :reviews, :users, index: true, foreign_key: true
    add_reference :reviews, :products, index: true, foreign_key: true
  end
end
