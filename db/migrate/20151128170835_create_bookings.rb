class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :sdate
      t.datetime :enddate
      t.integer :room_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
