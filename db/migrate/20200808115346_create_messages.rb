class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.string :image
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :room_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end