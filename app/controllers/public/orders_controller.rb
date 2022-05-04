class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @address = Adress.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.adress
    @order.name = @address.name
  end

  def complete
  end

  def index
    @order = current_customer.orders.all
  end

  def show
    
  end

  def order_params
  params.permit(:payment_method, :postal_code, :adress, :name)
  end

end
