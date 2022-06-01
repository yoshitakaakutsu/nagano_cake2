class Public::CartItemsController < ApplicationController

  def index
    @cart_item = current_customer.cart_items.all
     @total = @cart_item.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def edit
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_item_index_path
  end

  def all_destroy
    cart_item = CartItem.all
    current_customer.cart_items.destroy_all
    redirect_to cart_item_index_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id]).present?
			cart_item = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
			cart_item.amount += params[:cart_item][:amount].to_i
			cart_item.save
			redirect_to cart_item_index_path
		else
	    @cart_item.save
			redirect_to cart_item_index_path
		end
	end

	def update
		cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_item_index_path
	end

  private
  def cart_item_params
      params.require(:cart_item).permit(:product_id, :amount)
  end
end
