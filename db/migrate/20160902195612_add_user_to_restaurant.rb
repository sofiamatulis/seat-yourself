class AddUserToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :owner_id, :integer
  end
end
