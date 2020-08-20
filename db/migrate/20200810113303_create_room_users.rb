class CreateRoomUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :room_users do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :room_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
