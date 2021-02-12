class CoordinetesController < ApplicationController

  def index
    @coordinetes = Coordinete.all
    @new_coordinete = Coordinete.new
  end

  def create
    @coordinete = Coordinete.find(params[:id])
    @new_coordinete = Coordinete.new(coordinete_params)
    @coordinete.user_id = current_user.id
    if @coordinete.save
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
    params.require(:coordinete).permit(:name, :item_id)
    # score
  end

end
