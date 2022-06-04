class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit

  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_show_path
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :adress, :telephone_number, :email)
  end
end
