class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page]).reverse_order


  #   @tags = Item.tag_counts_on(:tags).order('count DESC')
  #   if @tag = params[:tag]   # タグ検索用
  #     @item = Item.tagged_with(params[:tag])   # タグに紐付く投稿
  #   end
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
    # @tags = @item.tag_counts_on(:tags)    # 投稿に紐付くタグの表示
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
      redirect_to item_path(@item), notice: "編集できました。"
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def get_tag_search
    @tags = Post.tag_counts_on(:tags).where('name LIKE(?)', "%#{params[:key]}%")
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :shop_name, :detail, :image, :tag_list)
    # score
  end

end
