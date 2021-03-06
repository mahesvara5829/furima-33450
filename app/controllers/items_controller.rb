class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :move,only: [:show,:edit,:update,:destroy]

  def index
    @items=Item.includes(:user).order("created_at DESC")
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id==@item.user_id&&@item.order==nil
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if current_user.id==@item.user_id
    @item.destroy
    redirect_to action: :index
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :discription, :category_id, :status_id, :send_fee_id, :send_area_id,:send_day_id).merge(user_id: current_user.id)
  end


  def move
    @item=Item.find(params[:id])
  end


  

end
