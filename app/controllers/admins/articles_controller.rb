class Admins::ArticlesController < ApplicationController
  def index
    @genres = Genre.where(is_active: true)

    if self.params[:title] #title検索による記事絞り込み検索
      @articles = Article.where("title LIKE ?", "%#{params[:title]}%").order(created_at: :desc).page(params[:page]).per(15)
    elsif params[:genre_select] #(sidebar)ジャンルによる記事絞り込み
      @articles = Article.where(genre_id: params[:genre_select].to_i).order(created_at: :desc).page(params[:page]).per(15)
    elsif params[:genre_article] #ジャンルindex画面からの遷移（各ジャンルの配信記事本数からの遷移）
      @articles = Article.where(genre_id: params[:genre_article].to_i).order(created_at: :desc).page(params[:page]).per(15)
    else
      @articles = Article.order(created_at: :desc).page(params[:page]).per(15)
    end
  end

  def new
    @genres = Genre.where(is_active: true)
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save
      redirect_to admins_articles_path
    else
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
