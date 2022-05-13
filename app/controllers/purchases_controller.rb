class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])    #備忘録。itemテーブル（別テーブル）から参照するので、paramsはカラム名で指定。

  end
end
