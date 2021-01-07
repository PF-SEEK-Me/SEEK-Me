class Customers::ArticlesController < ApplicationController
  def index
    @genres = Genre.where(is_active: true)

    if self.params[:title] #title検索による記事絞り込み検索
      @articles = Article.where("title LIKE ?", "%#{params[:title]}%").order(created_at: :desc).page(params[:page]).per(15)
    elsif params[:genre_select] #(sidebar)ジャンルによる記事絞り込み
      @articles = Article.where(genre_id: params[:genre_select].to_i).order(created_at: :desc).page(params[:page]).per(15)
    else
      @articles = Article.order(created_at: :desc).page(params[:page]).per(15)
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end
