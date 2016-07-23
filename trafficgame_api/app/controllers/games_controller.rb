class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)
    puts current_user.id
    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
#      params.require(:game).permit(:condition_id, :travel_mod, :user_id, :status, :start_date, :end_date, :origin, :destination, :budget, :travel_time, :current_loc_type, :location_id)
      params.require(:game).permit(:condition_id, :travel_mod, :status, :start_date, :end_date, :origin, :destination, :budget, :travel_time, :current_loc_type, :location_id)

    end
end
