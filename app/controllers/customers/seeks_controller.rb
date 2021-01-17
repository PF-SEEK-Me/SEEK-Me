class Customers::SeeksController < ApplicationController
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
