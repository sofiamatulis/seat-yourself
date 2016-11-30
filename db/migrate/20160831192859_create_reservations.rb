class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :party_size
      t.date :date
      t.time :time
      t.text :comment

      t.timestamps null: false
    end
  end
end
