class Admins::ArticlesController < ApplicationController
  def index
    @genres = Genre.where(is_active: true)
    @articles = Article.order(created_at: :desc).page(params[:page]).per(15)
    #title検索による記事絞り込み検索
    @articles_search = Article.where("title LIKE ?", "%#{params[:keyword]}%" )
  end

  def new
    @genres = Genre.where(is_active: true)
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save
      redirect_to articles_path
    end
    render :new
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
      redirect_to article_path(article)
    end
    render :edit
  end

  private
  def article_params
    params.require(:article).permit(:genre_id, :title, :image, :text, :category_1, :category_2, :category_3, :is_active)
  end

end
