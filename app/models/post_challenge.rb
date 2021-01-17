class PostChallenge < ApplicationRecord
  belongs_to :customer
  belongs_to :article
  has_many   :seeks, dependent: :destroy

  def seeked_by?(customer)
    seeks.where(customer_id: customer.id).exists?
  end

  attachment :image

  validates :comment, presence: true
end
