class PostChallenge < ApplicationRecord
  belongs_to :customer
  belongs_to :article
  attachment :image

  validates :comment, presence: true
end
