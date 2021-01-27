class Customers::PostChallengesController < ApplicationController
  def create
    article = Article.find(params[:article_id])

    post_challenge = current_customer.post_challenges.new(post_challenge_params)
    post_challenge.article_id = article.id
    if post_challenge.save
      redirect_to article_path(article)
    else
      redirect_to article_path(article)
      flash[:post_challange_error] = "**（入力必須）コメントを入力してください。**"
    end
  end

  def destroy
    PostChallenge.find_by(id: params[:id], article_id: params[:article_id]).destroy
    redirect_to article_path(params[:article_id])
  end

  private

  def post_challenge_params
    params.require(:post_challenge).permit(:customer_id, :article_id, :image, :comment)
  end
end
