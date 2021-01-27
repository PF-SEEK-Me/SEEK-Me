class Admins::ArticlesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.where(is_active: true)

    # 一覧画面に表示される記事の条件分岐
    ## title検索による記事絞り込み検索
    if params[:title]
      @articles = Article.where("title LIKE ?", "%#{params[:title]}%").display_page(params[:page], 20)
    ## (sidebar)ジャンルによる記事絞り込み
    elsif params[:genre_select]
      @articles = Article.where(genre_id: params[:genre_select].to_i).display_page(params[:page], 20)
    # ジャンルindex画面からの遷移（各ジャンルの配信記事本数からの遷移）
    elsif params[:genre_article]
      @articles = Article.where(genre_id: params[:genre_article].to_i).display_page(params[:page], 20)
    else
      @articles = Article.display_page(params[:page], 20)
    end

    # 閲覧履歴
    @browsing_histories = BrowsingHistory.all

    # いいね
    @favorites = Favorite.all
  end

  def new
    @genres = Genre.where(is_active: true)
    @article = Article.new
  end

  def create
    @genres = Genre.where(is_active: true)

    @article = Article.new(article_params)
    if @article.save
      redirect_to admins_articles_path
    else
      flash[:admins_article_error] = "**（入力必須）空欄に入力してください**"
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      redirect_to admins_article_path(article)
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:genre_id, :title, :image, :text, :category_1, :category_2, :category_3, :is_active)
  end
end
