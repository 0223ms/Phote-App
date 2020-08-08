class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :photo,    null: false
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end