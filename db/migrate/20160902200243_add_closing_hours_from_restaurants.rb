class AddClosingHoursFromRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :closing_hours, :time
  end
end
