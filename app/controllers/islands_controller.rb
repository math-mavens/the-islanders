class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_island, only: %i[show edit update destroy]

  def index
    @islands = Island.all
  end

  def show

    @island = Island.find(params[:id])
    @markers = Island.where(id: params[:id]).geocoded.map do |island|
      {
        lat: island.latitude,
        lng: island.longitude,
        info_window: render_to_string(partial: "info_window", locals: { island: island }),
        image_url: helpers.asset_url("the-islanders-map-logo.png")
      }
    end
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
    end
  end

  def edit
  end

  def update
    @island.update(island_params)
    redirect_to island_path(@island)
  end

  def destroy
    @island.destroy
    redirect_to islands_path
  end

  private

  def set_island
    @island = Island.find(params[:id])
  end

  def island_params
    params.require(:island).permit(:name, :description, :price_per_day, :address)
  end
end
