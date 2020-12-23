class HelpersController < ApplicationController
  before_action :set_helper, only: [:show, :update, :destroy]

  # GET /helpers
  def index
    @helpers = Helper.all

    render json: @helpers
  end

  # GET /helpers/1
  def show
    render json: @helper
  end

  # POST /helpers
  def create
    @helper = Helper.new(helper_params)

    if @helper.save
      render json: @helper, status: :created, location: @helper
    else
      render json: @helper.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /helpers/1
  def update
    if @helper.update(helper_params)
      render json: @helper
    else
      render json: @helper.errors, status: :unprocessable_entity
    end
  end

  # DELETE /helpers/1
  def destroy
    @helper.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_helper
      @helper = Helper.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def helper_params
      params.require(:helper).permit(:participants, :help_request_id, :full_at)
    end
end
