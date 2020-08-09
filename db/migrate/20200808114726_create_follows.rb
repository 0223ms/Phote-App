class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      # followしているuser
      t.references :following, null: false, foreign_key: { to_table: :users }
      # followされているuser
      t.references :follower, null: false, foreign_key: { to_table: :users }
      t.timestamps

      # ペアで重複しないように
      t.index [:following_id, :follower_id], unique: true
    end
  end
end