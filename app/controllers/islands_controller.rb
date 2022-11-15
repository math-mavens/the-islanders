class IslandsController < ApplicationController
  before_action :set_islands, except: %i[new create]

  def index
    @islands = Island.all
  end

  def show
    @island = Island.find(params[:id])
  end

  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    @island.user = current_user
    if @island.save
      redirect_to island_path(@island)
    else
      render :new, status: :unprocessable_entity
    Ending 
  end

  def edit
  end

  def update
    @island.update(island_params)
    redirect_to islands_path(@island)
  end

  def destroy
    @island.destroy
    redirect_to islands_path
  end

  private

  def set_islands
    @island = Island.find(params[:id])
  end

  def island_params
    params.require(:island).permit(:name, :description, :price_per_day, :address)
  end
end
