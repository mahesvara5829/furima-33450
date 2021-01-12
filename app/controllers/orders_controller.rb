class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_before, only: [:create, :index]

  def index
    @order_address=OrderAddress.new
    if current_user.id==@item.user_id
      redirect_to root_path
    end
  end

  def create
    @order_address=OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
  params.require(:order_address).permit(:post_cord,:send_area_id,:city,:address_detail,:apart_name_num,:phone_number).merge(user_id:current_user.id,item_id:params[:item_id])
  end

  def move_before
    @item = Item.find(params[:item_id])
  end



end



#(user_id: current_user.id,item_id: item.id)
#(order_id: order.id)