class Admin::HomesController < ApplicationController

  def index
    @order = Order.page(params[:page]).per(10)
  end

end
