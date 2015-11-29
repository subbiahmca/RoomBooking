class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :capacity
      t.string :phno
      t.string :email

      t.timestamps null: false
    end
  end
end
