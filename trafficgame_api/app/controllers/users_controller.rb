class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  skip_before_action :authenticate_request, only: [:create]
  wrap_parameters :user, include: [:name,:email, :password,:loginbefore,:hrrate]
  rescue_from ::Exception, with: :error_occurred
  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end
  def gethrrate
    hr=current_user.hrrate
    render json: {hrrate: hr}, status: 200
  end
  # POST /users
  def create
    puts "here"
    puts user_params
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
   puts "test" 
   
   @user=User.find(current_user.id)  
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])

    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation,:loginbefore,:hrrate)
    end

    def error_occurred(exception)
      render json: {error: exception.message}.to_json, status: 500
      return
    end
end
