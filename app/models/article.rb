class Article < ApplicationRecord
  belongs_to :genre
  attachment :image

  validates :genre_id,   presence: true
  validates :title,      presence: true
  validates :image,      presence: true
  validates :text,       presence: true
  validates :category_1, presence: true

  enum category_1: {
    "#": 0,
    "##": 1,
    "###": 2,
    "####": 3,
    "#####": 4,
    "######": 5
  }
end
