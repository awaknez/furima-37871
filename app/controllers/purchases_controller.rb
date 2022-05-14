class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: :index

  def index
    @item = Item.find(params[:item_id])    #itemテーブル（別テーブル）から参照するので、paramsはカラム名で指定。
    @purchase_address = PurchaseAddress.new
    if (current_user.id != @item.user.id) && (@item.purchase != nil)
      redirect_to root_path
    end
  end


  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:post_number, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id]) 
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def pay_item
    @item = Item.find(params[:item_id])
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.item_price,  
        card: purchase_params[:token],    
        currency: 'jpy'         
      )
  end
end
