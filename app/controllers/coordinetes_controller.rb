class CoordinetesController < ApplicationController

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
    @coordinete = Coordinete.find(params[:id])
    if @coordinete.user != current_user
      redirect_to items_path
    end
  end

  def update
    @coordinete = Coordinete.find(params[:id])
    if @coordinete.update(coordinete_params)
      redirect_to coordinetes_path, notice: '編集できました。'
    else
      render :edit
    end
  end

  def destroy
    @coordinete = Coordinete.find(params[:id])
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
end
