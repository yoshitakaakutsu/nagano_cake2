class Public::CartItemsController < ApplicationController

  def index
    @cart_item = CartItem.all

  end

  def edit

  end

  def update
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_item_index_path
  end

  def all_destroy
    cart_item = CartItem.all
    current_user.cart_item.destroy_all
    redirect_to cart_item_index_path
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.save!
    redirect_to cart_item_index_path
  end

  private

  private
  def cart_item_params
      params.require(:cart_item).permit(:product_id, :amount)
  end
end
