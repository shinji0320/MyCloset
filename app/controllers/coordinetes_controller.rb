class CoordinetesController < ApplicationController
  before_action :ensure_coordinete, only: [:edit, :update, :destroy]

  def index
    @coordinetes = Coordinete.all
    @coordinete = Coordinete.new
  end

  def create
    @coordinete = Coordinete.new(coordinete_params)
    @coordinete.user_id = current_user.id
    if @coordinete.save # 　&& coordinete.update_tables(item_ids: [1,2,34])を作成して保存
      #  TODO:　コードの見通しがようなるようにリファクタリング
      item_ids.each do |item_id|
        @coordinete.coordinete_tables.new(item_id: item_id)
        @coordinete.coordinete_tables
      end
      if @coordinete.save
        flash[:notice] = "コーディネートを追加しました"
        redirect_to coordinetes_path
      else
        @coordinetes = Coordinete.all
        render :index
      end
    else
      @coordinetes = Coordinete.all
      render :index
    end
  end

  def edit
  end

  def update
    if @coordinete.update(coordinete_params)
      flash[:notice] = "コーディネートを編集しました"
      redirect_to coordinetes_path
    else
      render :edit
    end
  end

  def destroy
    @coordinete.destroy
    @coordinetes = Coordinete.all
    redirect_to coordinetes_path
  end

  private

  def coordinete_params
    params.require(:coordinete).permit(:name)
  end

  def item_ids
    params[:coordinete][:item_ids].values.map(&:to_i)
  end

  def ensure_coordinete
    @coordinete = Coordinete.find(params[:id])
  end
end
