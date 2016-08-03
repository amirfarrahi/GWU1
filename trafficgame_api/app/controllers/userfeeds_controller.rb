class UserfeedsController < ApplicationController
  before_action :set_userfeed, only: [:show, :update, :destroy]

  # GET /userfeeds
  def index
    @userfeeds = Userfeed.all

    render json: @userfeeds
  end

  # GET /userfeeds/1
  def show
    render json: @userfeed
  end

  # POST /userfeeds
  def create
    @userfeed = Userfeed.new(userfeed_params)
    @userfeed.user_id=current_user.id
    puts @userfeed.user_id
    if @userfeed.save
      render json: @userfeed, status: :created, location: @userfeed
    else
      render json: @userfeed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /userfeeds/1
  def update
    if @userfeed.update(userfeed_params)
      render json: @userfeed
    else
      render json: @userfeed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /userfeeds/1
  def destroy
    @userfeed.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userfeed
      @userfeed = Userfeed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def userfeed_params
      params.require(:userfeed).permit(:game_id,:user_id, :question_id, :answer_id, :usert)
    end
end
