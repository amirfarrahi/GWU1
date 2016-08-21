require 'json_web_token'
class ApplicationController < ActionController::API
 before_action :authenticate_request


  attr_reader :current_user
  # helper_method :current_user

  private

  def authenticate_request
    #puts "heeeeeeeeeeeeeeeeeeeer"
    enheader =request.headers['Authorization'].split(' ').last if request.headers['Authorization']
    puts enheader
    dectoken= JsonWebToken.decode(enheader) if enheader
    puts "yeeeeeeeeeeees"
    puts dectoken
    @current_user = User.find(dectoken[:user_id]) if dectoken

    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
