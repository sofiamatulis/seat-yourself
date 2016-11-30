class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.integer :capacity
      t.integer :opening_hours
      t.integer :closing_hours
      t.string :website

      t.timestamps null: false
    end
  end
end
