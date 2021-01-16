class Admins::CustomersController < ApplicationController

  def index
    if self.params[:last_name]
      @customers = Customer.where("last_name LIKE ?", "%#{params[:last_name]}%").page(params[:page]).per(15)
    else
      @customers = Customer.all.page(params[:page]).per(15)
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def favorite
    if admin_signed_in?
      @customer = Customer.find(params[:id])

      @favorites = Favorite.where(customer_id: params[:id]).order(created_at: :desc).page(params[:page]).per(15)
      @browsing_histories = BrowsingHistory.all

      #価値観の分析
      ##全ての要素（価値観）を配列にする
      @values = []
      @favorites.each do |favorite|
        value_1 = favorite.article.category_1
        value_2 = favorite.article.category_2
        value_3 = favorite.article.category_3
        if value_2 != nil
          @values.concat([value_1, value_2])
          if value_3 != nil
            @values.concat([value_3])
          end
        end
      end
      ##要素（価値観）の多い順番に配列を並び替える（左から多い順に配列）
      @values = @values.group_by{|e| e}.sort_by{|_,v|-v.count}.map(&:first)
      ###並び替えた要素（価値観）中、多いもの（３つ）を取り出す
      @values_top_1 = @values[0]
      @values_top_2 = @values[1]
      @values_top_3 = @values[2]
    else
      redirect_to new_admin_session_path
    end
  end

end
