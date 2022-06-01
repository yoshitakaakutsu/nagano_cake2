class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @address = current_customer.adresses
  end

  def confirm
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.adress
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address] == "1"
      @address = Adress.find(params[:order][:adress_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.adress
      @order.name = @address.name
    elsif params[:order][:address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:adress]
      @order.name = params[:order][:name]
    end
    @cart_item = current_customer.cart_items
    @total = @cart_item.inject(0) { |sum, item| sum + item.sum_of_price }
    @totals = @cart_item.inject(0) { |sum, item| sum + item.sum_of_price } + 800
    @order_detail = Order.new(order_params)
  end

  def complete
  end

  def index
    @order = current_customer.orders.all

  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.save
    cart_items.each do |cart|
      oder_detail = OderDetail.new
      oder_detail.product_id = cart.product_id
      oder_detail.order_id = @order.id
      oder_detail.amount = cart.amount
      oder_detail.price = cart.product.price
      oder_detail.save
    end
    cart_items.destroy_all
    redirect_to order_complete_path
  end


  def show
    @order = Order.find(params[:id])
    
  end

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :status, :customer_id)
  end

  def order_detail_params
    params.require(:oder_detail).permit(:order_id, :product_id, :price, :amount)
  end

end
