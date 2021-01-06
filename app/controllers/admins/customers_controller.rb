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

end
