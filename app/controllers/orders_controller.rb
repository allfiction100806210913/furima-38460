class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_purchase_record = OrderPurchaseRecord.new
  end


  def create
       @item = Item.find(params[:item_id])
       @order_purchase_record = OrderPurchaseRecord.new(order_params)
    if @order_purchase_record.valid?
       pay_item
       @order_purchase_record.save
      return redirect_to root_path
    else
      redirect_to item_orders_path
    end
  end

  private

  def order_params
    params.require(:order_purchase_record).permit(:prefecture_id, :postal_code, :city, :building, :addresses, :phone_number, :item_id, :purchase_record_id).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end


  def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

end
