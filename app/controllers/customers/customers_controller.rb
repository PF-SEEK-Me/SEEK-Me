class Customers::CustomersController < ApplicationController
  def about
  end

  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    if customer.update(customer_params)
      redirect_to customer_path(current_customer)
    else
      render :edit
    end
  end

  def confirm
    @customer = current_customer
  end

  def hide
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "ご利用ありがとうございました！素敵な１日を！"
    redirect_to new_customer_session_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :age, :email, :postal_code, :address, :is_student)
  end
end
