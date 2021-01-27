class CreateSeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :seeks do |t|
      t.integer :customer_id,        null: false
      t.integer :article_id,         null: false
      t.integer :post_challenge_id,  null: false
      t.timestamps
    end
  end
end
