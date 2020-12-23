class HelpRequestsController < ApplicationController
  before_action :set_help_request, only: [:edit, :update]
  
  # GET /help_requests
  def index
    @help_requests = HelpRequest.all

    render json: @help_requests
  end

  # GET /help_requests/1
  def show
    render json: HelpRequest.find(params[:id])
  end

  # POST /help_requests
  def create
    @help_request = HelpRequest.new(help_request_params)
    #@help_request.date = date.now
    #@help_request.condition = 'ongoing'
    
    if @help_request.save
      render json: @help_request, status: :created, location: @help_request
    else
      render json: @help_request_params, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /help_requests/1
  def update
    if @help_request.update(help_request_params)
      render json: @help_request
    else
      render json: @help_request_params, status: :unprocessable_entity
    end
  end

  # DELETE /help_requests/1
  def destroy
    @help_request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_request
      @help_request = HelpRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def help_request_params
      #params.require(:help_request).permit(:title, :date, :user_id, :kind, :address, :latitude, :longitude, :helpers, :condition)
      params.require(:help_request).permit(:id, :help_request, :title, :date, :user_id, :kind, :address, :latitude, :longitude, :helpers, :condition, :description)
    end
end
