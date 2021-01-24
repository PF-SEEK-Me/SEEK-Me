class Article < ApplicationRecord
  belongs_to :genre
  has_many :browsing_histories, dependent: :destroy
  has_many :favorites,          dependent: :destroy
  has_many :post_challenges,    dependent: :destroy

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  def self.display_page(params_page, num)
    order(created_at: :desc).page(params_page).per(num)
  end

  attachment :image

  validates :genre_id,   presence: true
  validates :title,      presence: true
  validates :image,      presence: true
  validates :text,       presence: true
  validates :category_1, presence: true

  enum category_1: {
    "創意工夫": 0,
    "意思決定力": 1,
    "逆境への強さ": 2,
    "好奇心": 3,
    "行動力": 4,
    "共感": 5,
    "競争心": 6,
    "規律": 7,
    "原点回帰": 8,
    "平等性": 9,
    "差別化": 10,
    "意思伝達": 11,
    "上昇志向": 12,
    "承認欲求": 13,
    "自己承認": 14,
    "社交性": 15,
    "情報収集欲求": 16,
    "自己発信力": 17,
    "危険察知力": 18,
    "信条": 19,
    "帰属欲求": 20,
    "貢献心": 21,
    "責任感の強さ": 22,
    "戦略的思考力": 23,
    "完遂力": 24,
    "簡素化": 25,
    "平和主義": 26,
    "適応力": 27,
    "思考欲求": 28,
    "分析力": 29,
    "受容力": 30,
    "楽観力": 31,
    "予測力": 32,
    "修正力": 33,
  }, _prefix: true

  enum category_2: {
    "創意工夫": 0,
    "意思決定力": 1,
    "逆境への強さ": 2,
    "好奇心": 3,
    "行動力": 4,
    "共感": 5,
    "競争心": 6,
    "規律": 7,
    "原点回帰": 8,
    "平等性": 9,
    "差別化": 10,
    "意思伝達": 11,
    "上昇志向": 12,
    "承認欲求": 13,
    "自己承認": 14,
    "社交性": 15,
    "情報収集欲求": 16,
    "自己発信力": 17,
    "危険察知力": 18,
    "信条": 19,
    "帰属欲求": 20,
    "貢献心": 21,
    "責任感の強さ": 22,
    "戦略的思考力": 23,
    "完遂力": 24,
    "簡素化": 25,
    "平和主義": 26,
    "適応力": 27,
    "思考欲求": 28,
    "分析力": 29,
    "受容力": 30,
    "楽観力": 31,
    "予測力": 32,
    "修正力": 33,
  }, _prefix: true

  enum category_3: {
    "創意工夫": 0,
    "意思決定力": 1,
    "逆境への強さ": 2,
    "好奇心": 3,
    "行動力": 4,
    "共感": 5,
    "競争心": 6,
    "規律": 7,
    "原点回帰": 8,
    "平等性": 9,
    "差別化": 10,
    "意思伝達": 11,
    "上昇志向": 12,
    "承認欲求": 13,
    "自己承認": 14,
    "社交性": 15,
    "情報収集欲求": 16,
    "自己発信力": 17,
    "危険察知力": 18,
    "信条": 19,
    "帰属欲求": 20,
    "貢献心": 21,
    "責任感の強さ": 22,
    "戦略的思考力": 23,
    "完遂力": 24,
    "簡素化": 25,
    "平和主義": 26,
    "適応力": 27,
    "思考欲求": 28,
    "分析力": 29,
    "受容力": 30,
    "楽観力": 31,
    "予測力": 32,
    "修正力": 33,
  }, _prefix: true
end
