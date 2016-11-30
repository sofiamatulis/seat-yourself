class RemoveClosingHoursFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :closing_hours, :integer
  end
end
