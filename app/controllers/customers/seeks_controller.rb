class Customers::SeeksController < ApplicationController
  def index#企業用My Page内のSeek You!ページ
    @seeks = Seek.where(customer_id: current_customer.id).order(created_at: :desc).page(params[:page]).per(15)
  end

  def show
    @seek = Seek.find(params[:id])

    @student_info = Customer.find(@seek.post_challenge.customer.id)

    @posted_infos = PostChallenge.where(customer_id: @seek.post_challenge.customer.id).order(created_at: :desc).page(params[:page]).per(10)
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
