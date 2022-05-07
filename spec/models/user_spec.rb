require 'rails_helper'

RSpec.describe User, type: :model do
  before do
  @user = FactoryBot.build(:user)
  end

  context "ユーザーが新規登録ができる場合" do
    it "全ての情報が適切に入力されていれば登録できる" do
      expect(@user).to be_valid
    end
  end

  #異常系
  context "ユーザーが新規登録できない場合" do
    #1
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    #2
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    #3
    it "すでに登録されているemailは利用できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    #4
    it "@が無いemailは登録できない" do
      @user.email ="abcde"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    #5
    it "passwordが空だと登録できない" do
      @user.password =""
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    #6
    it "passwordは6文字以上でないと登録できない" do
      @user.password = "abcde"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    #7
    it "passwordは6文字以上128字以下でないと登録できない" do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    #8
    it "passwordとpassword_confirmationが不一致だと登録できない" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdefg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    #9
    it "名前（name_first_name）が空だと登録できない" do
      @user.name_first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first name can't be blank")
    end
    #10
    it "名前カナ（name_first_name_kana）が空だと登録できない" do
      @user.name_first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first name kana can't be blank")
    end
    #11
    it "名字（name_family_name)が空だと登録できない" do
      @user.name_family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name family name can't be blank")
    end
    #12
    it "名字カナ（name_family_name_kana)が空だと登録できない" do
      @user.name_family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name family name kana can't be blank")
    end
    #13
    it "名字（name_family_name)が全角文字以外だと登録できない" do
      @user.name_family_name ="sample"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name family name is invalid")
    end
    #14
    it "名前（name_first_name)が全角文字以外だと登録できない" do
      @user.name_first_name ="sample"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first name is invalid")
    end
    #15
    it "名前カナ（name_first_name_kana）がカタカナ以外だと登録できない" do
      @user.name_first_name_kana ="kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first name kana is invalid")
    end
    #16
    it "名字カナ（name_family_name_kana）がカタカナ以外だと登録できない" do
      @user.name_family_name_kana ="kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name family name kana is invalid")
    end
    #17
    it "passwordが半角英字のみの場合は登録できない" do
      @user.password ="passwordsample"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    #18
    it "passwordが数字のみの場合は登録できない" do
      @user.password = "12345678"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    #19
    it "生年月日が空だと登録できない" do
      @user.birthday =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
