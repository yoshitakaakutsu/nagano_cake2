class Public::AdressController < ApplicationController

  def index
    @adress = Adress.new
    @adresses = current_customer.adresses
  end

  def edit
    @adress = Adress.find(params[:id])
  end

  def create
    adress = Adress.new(adress_params)
    adress.customer_id = current_customer.id
    adress.save!
    redirect_to adress_index_path
  end

  def update
    adress = Adress.find(params[:id])
    adress.customer_id = current_customer.id
    adress.update(adress_params)
    redirect_to adress_index_path
  end

  def destroy
    adress = Adress.find(params[:id])
    adress.destroy
    redirect_to adress_index_path
  end

  def adress_params
    params.require(:adress).permit(:name, :postal_code, :adress, :customer_id)
  end
end
