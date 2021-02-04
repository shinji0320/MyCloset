class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
    redirect_to genres_path
  end
end
