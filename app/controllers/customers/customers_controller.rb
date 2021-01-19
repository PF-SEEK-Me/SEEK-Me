class Customers::CustomersController < ApplicationController
  def about
  end

  def show
    @posted_infos = PostChallenge.where(customer_id: current_customer.id).order(created_at: :desc).page(params[:page]).per(10)
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:customer_update] = "**会員情報を更新しました。**"
      redirect_to customer_path(current_customer)
    else
      flash.now[:customer_error] = "**（入力必須）空欄に入力してください**"
      render :edit
    end
  end

  def confirm
  end

  def hide
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "ご利用ありがとうございました！素敵な１日を！"
    redirect_to new_customer_session_path
  end

  def favorite#学生用My Page内のSeek Me!
    if customer_signed_in?
      @favorites = Favorite.where(customer_id: current_customer.id).order(created_at: :desc).page(params[:page]).per(10)
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
      redirect_to new_customer_session_path
    end

    #企業オファー（企業会員にgoodされたチャレンジ内容）
    @seeks = Seek.order(created_at: :desc).page(params[:page]).per(10)
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :age, :email, :postal_code, :address, :telephone_number, :is_student)
  end
end
