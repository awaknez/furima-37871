class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to :index
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :text, :item_genre_id, :item_status_id, :item_shipping_cost_id, :pregecture, :item_shipping_days_id, :item_price, :image).merge(user_id:current_user.id)
  end

end