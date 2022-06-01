class Admin::OderDetailsController < ApplicationController

  def update
    @order_detail = OderDetail.find(params[:order_id])
    @order = @order_detail.order
    @order_details = @order.oder_details
    @order_detail.update(oder_detail_params)
    redirect_to admin_order_path
  end


  private

  def oder_detail_params
    params.require(:oder_detail).permit(:making_status)
  end

end
