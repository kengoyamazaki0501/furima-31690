class OrdersController < ApplicationController
  before_action :item_find, only:[:index, :create]
  def index
    @order_address = OrderAddress.new
  end

  def new
  end



  def create
    @order_address = OrderAddress.new(order_params)
    # binding.pry
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end




  private
  def order_params
    params.require(:order_address).permit(:item, :user, :postal_code, :country_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id] )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end