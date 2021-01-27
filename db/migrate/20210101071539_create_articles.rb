class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer  :genre_id,   null: false
      t.string   :title,      null: false
      t.string   :image_id,   null: false
      t.text     :text,       null: false
      t.integer  :category_1, null: false
      t.integer  :category_2
      t.integer  :category_3
      t.boolean  :is_active,  null: false, default: true
      t.timestamps
    end
  end
end
