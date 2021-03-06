class ItemsController < ApplicationController
  before_action :authenticate_user! ,only: [:new, :destroy, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  #before_action :move_to_index, only: [:edit]

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
  
  end

  def edit
  unless (current_user.id == @item.user_id) && (@item.purchase == nil)
      redirect_to action: :index
    end

  end

  def update
    if @item.update(item_params)
        redirect_to item_path(@item)
    else
        render :edit    
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :text, :item_genre_id, :item_status_id, :item_shipping_cost_id, :prefecture_id, :item_shipping_days_id, :item_price, :image).merge(user_id:current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  #def move_to_index
  #  unless user_signed_in?
  #    redirect_to action: :index
  #  end
  #end
end