class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to root_path                    
    else
    render :new   
    end                
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end



  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :price, :image, :status_id, :shipping_status_id, :prefecture_id, :scheduled_delivery_id, :category_id).merge(user_id: current_user.id)
  end



  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end
