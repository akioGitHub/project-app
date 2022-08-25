class CreateEnteringTheRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :entering_the_rooms do |t|
      t.references :user,       null: false, foreign_key: true
      t.references :room,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
