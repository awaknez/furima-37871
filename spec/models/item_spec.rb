require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  context "新規出品できる場合" do
    it "全ての情報が適切に入力されていれば新規出品できる" do
      expect(@item).to be_valid
    end
  end

  context "出品できない場合" do
    it "画像が添付されていない場合は出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Image can't be blank")
    end
    it "商品の名前が空だと出品できない" do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item name can't be blank")
    end
    it "商品説明が空白だと出品できない" do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include ("Text can't be blank")
    end
    it "商品分類が選択されていないと出品できない" do
      @item.item_genre_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item genre can't be blank")
    end
    it "商品の状態が選択されていないと出品できない" do
      @item.item_status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item status can't be blank")
    end
    it "配送者が選択されていないと出品できない" do
      @item.item_shipping_cost_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item shipping cost can't be blank")
    end
    it "配送地域が選択されていないと出品できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
    end
    it "配送日数が選択されていないと出品できない" do
      @item.item_shipping_days_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item shipping days can't be blank")
    end
    it "商品価格が空白だと出品できない" do
      @item.item_price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item price can't be blank")
    end
    it "商品価格が300円未満では出品できない" do
      @item.item_price = "100"
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item price is out of setting range")
    end
    it "商品価格が全角入力だと出品できない" do
      @item.item_price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item price is out of setting range")
    end
    it "商品価格が9999999円以上では出品できない" do
      @item.item_price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item price is out of setting range")
    end
    it "userが紐づいていないと出品できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("User must exist")
    end

  end
end
