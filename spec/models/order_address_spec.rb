require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end
      context '新規登録できない時' do
    it 'post_cordが空だと保存できないこと' do
      @order_address.post_cord = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post cord can't be blank")
    end
    it 'send_area_idがが空だと保存できないこと' do
      @order_address.send_area_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Send area can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'address_detailがが空だと保存できないこと' do
      @order_address.address_detail = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address detail can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'tokenがが空だと保存できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.post_cord = 0000000
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post cord is invalid. Include hyphen(-)")
    end
    it 'phone_numberは11桁以上だと保存できない' do
      @order_address.phone_number = 0000000000000
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number within 11 digits")
    end
    it 'phone_numberはハイフンがあると保存できない' do
      @order_address.phone_number = 00-000-000
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number within 11 digits")
    end
    it 'phone_numberは英数混合だとと保存できない' do
      @order_address.phone_number = '0000000000u'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number within 11 digits")
    end
    it 'user_idがが空だと保存できないこと' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'tokenがが空だと保存できないこと' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  
    end
  
      context '商品購入できる時' do
        it '全ての情報を入力すれば購入できる' do
          expect(@order_address).to be_valid
        end
      end
    end
end 