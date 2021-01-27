class Customers::SeeksController < ApplicationController
  before_action :authenticate_customer!

  # 企業用My Page内のSeek You!ページ
  def index
    @seeks = Seek.where(customer_id: current_customer.id).display_page(params[:page], 15)
  end

  def show
    @seek = Seek.find(params[:id])

    # goodボタンを押した学生情報
    @student_info = Customer.find(@seek.post_challenge.customer.id)

    # goodボタンを押したチャレンジ内容
    @posted_infos = PostChallenge.where(customer_id: @seek.post_challenge.customer.id).display_page(params[:page], 15)

    # goodボタンを押した学生の興味分野（いいねを押した記事から分析）
    favorites = Favorite.where(customer_id: @student_info.id)
    favorites = favorites.group(:article_id).order(count_product_id: :desc).limit(3).count(:article_id).keys
    if !favorites[0].nil?
      @interest_1 = Genre.find(favorites[0]).name
    end
    if !favorites[1].nil?
      @interest_2 = Genre.find(favorites[1]).name
    end
    if !favorites[2].nil?
      @interest_3 = Genre.find(favorites[2]).name
    end
  end

  def create
    @article = Article.find(params[:article_id])

    seek = current_customer.seeks.new(seek_params)
    seek.article_id = @article.id
    seek.save
    redirect_to article_path(@article.id)
  end

  private

  def seek_params
    params.permit(:customer_id, :article_id, :post_challenge_id)
  end
end
