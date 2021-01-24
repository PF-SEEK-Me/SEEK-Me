class Customers::ArticlesController < ApplicationController
  def index
    @genres = Genre.where(is_active: true)

    # 一覧画面に表示される記事の条件分岐
    ## title検索による記事絞り込み検索
    if params[:title]
      @articles = Article.where("title LIKE ?", "%#{params[:title]}%").display_page(params[:page], 20)
    ## (sidebar)ジャンルによる記事絞り込み
    elsif params[:genre_select]
      @articles = Article.where(genre_id: params[:genre_select].to_i).display_page(params[:page], 20)
    else
      @articles = Article.display_page(params[:page], 20)
    end

    # 閲覧履歴
    @browsing_histories = BrowsingHistory.all
  end

  def show
    @article = Article.find(params[:id])

    # 閲覧履歴テーブルのレコード作成
    if customer_signed_in?
      browsing_history = @article.browsing_histories.new
      browsing_history.customer_id = current_customer.id
      if BrowsingHistory.where(customer_id: current_customer.id, article_id: params[:id]).empty?
        browsing_history.save
      end
    end

    # コメント投稿
    @post_challenge = PostChallenge.new
    @post_challenges = PostChallenge.where(article_id: @article.id).display_page(params[:page], 10)

    # Seek You!テーブルへの空レコード
    @seek = Seek.new
  end
end
