class UserlocationsController < ApplicationController
  before_action :set_userlocation, only: [:show, :update, :destroy]

  # GET /userlocations
  def index
    @userlocations = Userlocation.all

    render json: @userlocations
  end
  def updateloc
   userloc = Userlocation.find_by(user_id: current_user.id)
   puts userloc.inspect
   userloc.update(lat: params[:lat],lon: params[:lon])
   if userloc.save
      render json: userloc, status: :created, location: userloc
    else
      render json: userloc.errors, status: :unprocessable_entity
    end


  end
  # GET /userlocations/1
  def show
    render json: @userlocation
  end

  # POST /userlocations
  def create
    @userlocation = Userlocation.new(userlocation_params)

    if @userlocation.save
      render json: @userlocation, status: :created, location: @userlocation
    else
      render json: @userlocation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /userlocations/1
  def update
    if @userlocation.update(userlocation_params)
      render json: @userlocation
    else
      render json: @userlocation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /userlocations/1
  def destroy
    @userlocation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userlocation
      @userlocation = Userlocation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def userlocation_params
      params.require(:userlocation).permit(:user_id, :lat, :lon)
    end
end
