class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @item_comment = ItemComment.new
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
    params.require(:item).permit(:genre_id, :name, :shop_name, :detail, :image)
    # score
  end

end
