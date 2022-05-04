class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customers_show_path(customer.id)
  end


private
  def customer_params
    params.require(:customer).permit(:name, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :adress, :telephone_number)
  end

end