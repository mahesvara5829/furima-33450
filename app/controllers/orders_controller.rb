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
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
      #保存できなかった場合にもページの情報は必要
    end
  end

  private
  def order_params
  params.require(:order_address).permit(:post_cord,:send_area_id,:city,:address_detail,:apart_name_num,:phone_number).merge(user_id:current_user.id,item_id:params[:item_id],token: params[:token])
  end

  def move_before
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end





end



#order_idを入れない意味はあとで保存されるものだから