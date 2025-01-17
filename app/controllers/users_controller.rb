class UsersController < ApplicationController
    before_action :set_user, only: [ :update, :destroy]
    skip_before_action :authorized, only: [:create, :profile]
  
    def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end
  
    def auth_header
      # { Authorization: 'Bearer <token>' }
      request.headers['Authorization']
    end
  
    # GET /users
    def index
      @users = User.all
  
      render json: @users
    end
  
    # GET /users/1
    def show
      render json: @user
    end
  
    # POST /users
    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end
  
    # PATCH/PUT /users/1
    def update
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
        params.require(:user).permit(:first_name, :last_name, :username, :city, :state, :password, :password_confirmation, :image)
      end
end