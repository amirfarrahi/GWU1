class EdgemetaController < ApplicationController
  before_action :set_edgemetum, only: [:show, :update, :destroy]

  # GET /edgemeta
  def index
    @edgemeta = Edgemetum.all

    render json: @edgemeta
  end

  # GET /edgemeta/1
  def show
    render json: @edgemetum
  end

  # POST /edgemeta
  def create
    @edgemetum = Edgemetum.new(edgemetum_params)

    if @edgemetum.save
      render json: @edgemetum, status: :created, location: @edgemetum
    else
      render json: @edgemetum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /edgemeta/1
  def update
    if @edgemetum.update(edgemetum_params)
      render json: @edgemetum
    else
      render json: @edgemetum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /edgemeta/1
  def destroy
    @edgemetum.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edgemetum
      @edgemetum = Edgemetum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def edgemetum_params
      params.require(:edgemetum).permit(:edge_id, :mode_id, :condition_id, :cost)
    end
end
