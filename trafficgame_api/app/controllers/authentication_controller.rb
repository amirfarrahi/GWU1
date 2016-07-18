class AuthenticationController< ApplicationController
  skip_before_action :authenticate_request

  def authenticate
     user = User.find_by_email(params[:email])
#     puts user.inspect
     return invalid_login_attempt unless user && user.authenticate(params[:password])
     render :json=> {:success=>true, :auth_token=>JsonWebToken.encode('user_id':user.id),:name=>user.name }
  end

  def invalid_login_attempt
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end
     
#    command = AuthenticateUser.call(params[:email], params[:password],params[:name])
#    puts #{command.name}

#    if command.success?
#      render json: { "status": "success",
 #                    "data": {
 #                     auth_token: command.result},
 #                    "message": "" }
 #   else
 #     render json: { "status": "error",
 #                    "data": "",
 #                    "message": command.errors }
 #   end

 # end
end
