class CreatePostChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :post_challenges do |t|
      t.integer :customer_id, null: false
      t.integer :article_id,  null: false
      t.string  :image_id
      t.text    :comment,     null: false
      t.timestamps
    end
  end
end
