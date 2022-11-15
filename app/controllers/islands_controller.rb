class IslandsController < ApplicationController
  def index
    @islands = Island.all
  end

  def show
    @island = Island.find(params[:id])
  end

  def create
    @island = Island.new(island_params)
    if @island.save
      redirect_to root_path
    end
  end

  private

  def island_params
    params.require(:island).permit(:name, :description, :price_per_day, :latitude, :longitude, :address)
  end
end
