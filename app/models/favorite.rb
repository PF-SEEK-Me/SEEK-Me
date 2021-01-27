class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :article

  def self.display_page(params_page, num)
    order(created_at: :desc).page(params_page).per(num)
  end
end
