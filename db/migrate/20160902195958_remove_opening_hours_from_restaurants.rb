class RemoveOpeningHoursFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :opening_hours, :integer
  end
end
