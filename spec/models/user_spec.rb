require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it "emailが空では登録できない" do
      @user.email=""   
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "すでに登録されているemailでは登録できない" do
    end

    it "emailに@がなければ登録できない" do
      @user.email="kkkkkk"   
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが6文字以上でなければ登録できない" do
      @user.password = "m1111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角英数字混合でなければ登録できない" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordは確認用含めて2回入力しないと登録できない" do
      @user.password = "123rrr"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordとpassword確認用が一致していないと登録できない" do
      @user.password = "123rrr"
      @user.password_confirmation = "1234rrr"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー名は名字と名前が両方ないと登録できない" do
      @user.last_name=""
      @user.first_name=""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")
    end


    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力があれば登録できる" do
      expect(@user).to be_valid
    end


    it "ユーザー本名のフリガナは、名字と名前両方ないと登録できない" do
      @user.last_name_kana=""
      @user.first_name_kana=""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "First name kana can't be blank")
    end


    it "ユーザー本名のフリガナは、全角（カタカナ）での入力出ないと登録できない" do
      @user.last_name_kana="もり"
      @user.first_name_kana="もり"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end


    it "生年月日が必須であること" do
      @user.birthday=""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end





  
  end


end
