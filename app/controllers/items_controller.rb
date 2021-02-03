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
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private

  def item_params
    params.require(:item).permit(:genre_id, :item, :shop_name, :detail, :image)
  end
    
end
