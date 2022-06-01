class Public::ItemsController < ApplicationController

  def index
    @product = Product.all.page(params[:page]).per(8)

  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def item_params
    params.permit(:name, :introduction, :price, :genre_id)
  end
end
