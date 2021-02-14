class ItemsController < ApplicationController
  before_action :ranks, only: [:index]

  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page]).reverse_order
    @item_comment = ItemComment.new
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
    @item = Item.find(params[:id])
    if @item.user != current_user
      redirect_to items_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '編集できました。'
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def ranks
    @all_favorite_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
    @all_comment_ranks = Item.find(ItemComment.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
    @all_genre_ranks = Item.find(Item.group(:genre_id).order('count(genre_id) desc').limit(3).pluck(:genre_id))
  end

  def item_params
    params.require(:item).permit(:genre_id, :name, :shop_name, :detail, :image, :private)
    # score
  end
end
