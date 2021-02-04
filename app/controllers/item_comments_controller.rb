class ItemCommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @item_comment = ItemComment.new(item_comment_params)
    @item_comment.item_id = @item.id
    @item_comment.user_id = current_user.id
    @item_comment.save
    redirect_to items_path
  end

  def destroy
    @item = Item.find(params[:item_id])
    @item_comment.item_id = @item.id
    @item_comment.user_id = current_user.id
    @item_comment.destroy
    redirect_to items_path
  end

  private

  def item_comment_params
    params.require(:item_comment).permit(:comment)
  end

end
