class AddOpeningHoursFromRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :opening_hours, :time
  end
end
