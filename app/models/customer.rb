class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :browsing_histories, dependent: :destroy
  has_many :favorites,          dependent: :destroy
  has_many :post_challenges,    dependent: :destroy

  enum gender: {"男性": 0, "女性": 1}

  #有効会員のみログインできるように設定する
  def active_for_authentication?
    super && (self.is_active == true)
  end
end
