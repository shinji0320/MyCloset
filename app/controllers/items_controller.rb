class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to items_path
  end

  def show
    @Item = Item.find(params[:id])
  end

  def edit
    @Item = Item.find(params[:id])
  end

  def update
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :item, :shop_name, :detail, :image)
  end

end
