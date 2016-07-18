class EdgesController < ApplicationController
  before_action :set_edge, only: [:show, :update, :destroy]

  # GET /edges
  def index
    @edges = Edge.all

    render json: @edges
  end

  # GET /edges/1
  def show
    render json: @edge
  end

  # POST /edges
  def create
    @edge = Edge.new(edge_params)

    if @edge.save
      render json: @edge, status: :created, location: @edge
    else
      render json: @edge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /edges/1
  def update
    if @edge.update(edge_params)
      render json: @edge
    else
      render json: @edge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /edges/1
  def destroy
    @edge.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edge
      @edge = Edge.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def edge_params
      params.require(:edge).permit(:name, :desc)
    end
end
