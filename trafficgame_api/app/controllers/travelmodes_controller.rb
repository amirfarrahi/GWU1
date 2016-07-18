class TravelmodesController < ApplicationController
  before_action :set_travelmode, only: [:show, :update, :destroy]

  # GET /travelmodes
  def index
    @travelmodes = Travelmode.all

    render json: @travelmodes
  end

  # GET /travelmodes/1
  def show
    render json: @travelmode
  end

  # POST /travelmodes
  def create
    @travelmode = Travelmode.new(travelmode_params)

    if @travelmode.save
      render json: @travelmode, status: :created, location: @travelmode
    else
      render json: @travelmode.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /travelmodes/1
  def update
    if @travelmode.update(travelmode_params)
      render json: @travelmode
    else
      render json: @travelmode.errors, status: :unprocessable_entity
    end
  end

  # DELETE /travelmodes/1
  def destroy
    @travelmode.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travelmode
      @travelmode = Travelmode.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def travelmode_params
      params.require(:travelmode).permit(:name, :desc)
    end
end
