class ItemsController < ApplicationController
  

  def index
  end

  def new
    @item=Item.new
  end

  def create
    Item.create(item_params)

  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :discription, :category_id, :status_id, :send_fee_id, :send_area_id, :send_days_id).merge(user_id: current_user.id)
  end


  

end
