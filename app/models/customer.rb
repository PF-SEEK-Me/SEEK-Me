class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name,        presence: true
  validates :first_name,       presence: true
  validates :last_name_kana,   presence: true
  validates :first_name_kana,  presence: true
  validates :gender,           presence: true
  validates :age,              presence: true
  validates :postal_code,      presence: true
  validates :address,          presence: true
  validates :telephone_number, presence: true

  has_many :browsing_histories, dependent: :destroy
  has_many :favorites,          dependent: :destroy
  has_many :post_challenges,    dependent: :destroy
  has_many :seeks,              dependent: :destroy

  enum gender: {"男性": 0, "女性": 1}

  #有効会員のみログインできるように設定する
  def active_for_authentication?
    super && (self.is_active == true)
  end

end
