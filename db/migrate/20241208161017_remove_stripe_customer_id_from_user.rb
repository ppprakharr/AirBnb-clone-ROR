class RemoveStripeCustomerIdFromUser < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :stripe_customer_id
  end
end