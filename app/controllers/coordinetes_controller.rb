class CoordinetesController < ApplicationController
  before_action :ensure_coordinete, only: [:edit, :update, :destroy]

  def index
    @coordinetes = Coordinete.all
    @coordinete = Coordinete.new
  end

  def create
    @coordinete = Coordinete.new(coordinete_params)
    item_ids.each do |item_id|
      @coordinete.coordinete_tables.new(item_id: item_id)
    end
    if @coordinete.save
       flash[:notice] = "コーディネートを追加しました"
       redirect_to coordinetes_path
    else
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
