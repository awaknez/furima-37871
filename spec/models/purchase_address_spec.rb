require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe "購入情報の保存" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context "購入できる場合" do
      it "全ての情報が入力されていれば購入できる" do
        expect(@purchase_address).to be_valid
      end
      it "建物名（building_name)が空でも購入できる" do
        @purchase_address.building_name = ""
        expect(@purchase_address).to be_valid
      end
    end

    context "購入できない（問題がある）場合" do
      it "郵便番号が空だと購入できない" do
        @purchase_address.post_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number can't be blank")
      end
      it "郵便番号にハイフンがないと購入できない" do
        @purchase_address.post_number = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it "郵便番号が全角入力されていると購入できない" do
        @purchase_address.post_number = "１２３ー４５６７"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it "郵便番号が7桁以下だと購入できない" do
        @purchase_address.post_number = "123-456"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it "都道府県が空だと購入できない" do
        @purchase_address.prefecture_id = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "都道府県の選択においてid:1(---)を選択すると購入できない" do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村が空だと購入できない" do
        @purchase_address.municipality = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が空だと登録できない" do
        @purchase_address.address = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空だと登録できない" do
        @purchase_address.phone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号にハイフンがあると購入できない" do
        @purchase_address.phone_number = "090-1234-5678"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号が全角入力されていると購入できない" do
        @purchase_address.phone_number = "０９０１２３４５６７８"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号が9桁以下だと購入できない" do
        @purchase_address.phone_number = "090123456"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号が12桁以上だと購入できない" do
        @purchase_address.phone_number = "090123456789"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "user_idが空だと購入（保存）できない" do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと購入（保存）できない" do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it "Tokenが空だと購入できない" do
        @purchase_address.token = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end
