require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "出品できない" do
    it "nameが空だと出品できない" do
      @item.name=""
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end

    it "imageが空だと出品できない" do
      @item.image=nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end

    it "discriptionが空だと出品できない" do
      @item.discription=""
      @item.valid?
      expect(@item.errors.full_messages).to include "Discription can't be blank"
    end

    it "category_idが空だと出品できない" do
      @item.category_id=""
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end

    it "category_idが1だと出品できない" do
      @item.category_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 1"
    end

    it "status_idが空だと出品できない" do
      @item.status_id=""
      @item.valid?
      expect(@item.errors.full_messages).to include "Status can't be blank"
    end

    it "status_idが1だと出品できない" do
      @item.status_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include "Status must be other than 1"
    end

    it "send_fee_idが空だと出品できない" do
      @item.send_fee_id=""
      @item.valid?
      expect(@item.errors.full_messages).to include "Send fee can't be blank"
    end

    it "send_fee_idが1だと出品できない" do
      @item.send_fee_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include "Send fee must be other than 1"
    end

    it "send_area_idが空だと出品できない" do
      @item.send_area_id=""
      @item.valid?
      expect(@item.errors.full_messages).to include "Send area can't be blank"
    end

    it "send_area_idが1だと出品できない" do
      @item.send_area_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include "Send area must be other than 1"
    end

    it "send_day_idが空だと出品できない" do
      @item.send_day_id=""
      @item.valid?
      expect(@item.errors.full_messages).to include "Send day can't be blank"
    end

    it "send_day_idが1だと出品できない" do
      @item.send_day_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include "Send day must be other than 1"
    end

    it "priceが空だと出品できない" do
      @item.price=""
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it "priceが300円より下だと出品できない" do
      @item.price=299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
    end

    it "priceが9999999円より上だと出品できない" do
      @item.price=10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
    end

    it "priceが半角数字意外だと出品できない" do
      @item.price="３３３３"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end

  end

end
