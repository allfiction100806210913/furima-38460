class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  
  def index
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

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :price, :image, :status_id, :shipping_status_id, :prefecture_id, :scheduled_delivery_id, :category_id).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
  
  #prototype_id: params[:prototype_id]


      #validates :item_text           , presence: true
      #validates :item_category_id           , presence: true
    #validates :item_status_id           , presence: true
    #validates :shipping_status_id           , presence: true
    #validates :item_prefecture_id           , presence: true
    #validates :item_scheduled_delivery_id           , presence: true
    #validates :price           , presence: true
    #validates :user           , presence: true
end
