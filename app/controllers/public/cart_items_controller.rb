class Public::CartItemsController < ApplicationController

  def index
    @cart_item = CartItem.all
  end

  def edit

  end

  def update
  end

  def destroy
  end

  def all_destroy
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
