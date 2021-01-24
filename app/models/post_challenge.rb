class PostChallenge < ApplicationRecord
  belongs_to :customer
  belongs_to :article
  has_many   :seeks, dependent: :destroy

  def seeked_by?(customer)
    seeks.where(customer_id: customer.id).exists?
  end

  def self.display_page(params_page, num)
    order(created_at: :desc).page(params_page).per(num)
  end

  attachment :image

  validates :comment, presence: true
end
