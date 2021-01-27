class CreateBrowsingHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :browsing_histories do |t|
      t.integer :customer_id, null: false
      t.integer :article_id,  null: false
      t.timestamps
    end
  end
end
