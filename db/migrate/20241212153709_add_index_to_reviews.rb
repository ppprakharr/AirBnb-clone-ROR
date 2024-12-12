class AddIndexToReviews < ActiveRecord::Migration[8.0]
  def change
    add_index :reviews, [:reservation_id, :user_id, :property_id], unique: true
  end
end
