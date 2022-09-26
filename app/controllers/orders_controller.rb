class OrdersController < ApplicationController

  def index
  end









  private


  def order_params
    params.require(:order).permit(:item_prefecture_id, :city, :building, :addresses, :phone_number).merge(purchase_record: current_user.id)
  end

end
