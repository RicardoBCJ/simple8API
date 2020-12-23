class SessionController < ApplicationController    
    def login
        user = User.find_by :email=>params[:email]
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            user_json = user.to_json
            render json: {
                user: user_json,               
                jwt: token}
        else
            render json: {status: "error", message: "User or email wrong, please try again"}
        end
    end
                                
   
    def auto_login
        if session_user
            render json: session_user
        else
            render json: {errors: "No User Logged In."}
        end     
    end
end