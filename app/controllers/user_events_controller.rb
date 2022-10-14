class UserEventsController < ApplicationController
    before_action :set_user_event, only: [:show, :update, :destroy]
    skip_before_action :authorized
  
    # GET /user_events
    def index
      @user_events = UserEvent.all
  
      render json: @user_events
    end
  
    # GET /user_events/1
    def show
      render json: @user_event
    end
  
    # POST /user_events
    def create
      @user_event = UserEvent.create(user_event_params)
      # if @user_event.save
      #   render json: @user_event, status: :created, location: @user_event
      # else
      #   render json: @user_event.errors, status: :unprocessable_entity
      # end
      render json: @user_event
    end
  
    # PATCH/PUT /user_events/1
    def update
      if @user_event.update(user_event_params)
        render json: @user_event
      else
        render json: @user_event.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /user_events/1
    def destroy
      @user = User.find_by(id: @user_event.user_id)
      @user_event.destroy
      render json: @user
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user_event
        @user_event = UserEvent.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def user_event_params
        params.require(:user_event).permit(:user_id, :event_id)
      end
end