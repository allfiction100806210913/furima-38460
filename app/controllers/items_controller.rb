class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index, :show]
  before_action :carent_user, except:[:index, :show]

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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
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

  def carent_user
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
