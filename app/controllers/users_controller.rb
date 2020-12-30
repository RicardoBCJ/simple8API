class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
   def show
        user = User.find_by id:params[:id]
        if user
           render json: user
        else 
           render json: {error: 'Error finding account'}
        end
    end


    def update
      user = User.find_by id:params[:id]
      if user.update(user_params)
        render json: user
      else
        render json: user_params, status: :unprocessable_entity
      end
    end  

    def create
        user = User.new(user_params)
        if user.save
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {
                :user => user,
                :jwt => token
            }
        else
            render json: {error: 'Error creating account'}
        end
    end

    private

    def user_params
      params.permit(:name, :password, :email, :lastname, :imageurl)
    end
end
