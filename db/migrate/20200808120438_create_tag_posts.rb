class CreateTagPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_posts, id: false do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end