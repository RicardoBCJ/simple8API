class LegaldocumentsController < ApplicationController
  before_action :set_legaldocument, only: [:show, :update, :destroy]

  # GET /legaldocuments
  def index
    @legaldocuments = Legaldocument.all

    render json: @legaldocuments
  end

  # GET /legaldocuments/1
  def show
    render json: @legaldocument
  end

  # POST /legaldocuments
  def create
    @legaldocument = Legaldocument.new(legaldocument_params)
    #@legaldocument.user = params[:user_id]

    if @legaldocument.save
      render json: @legaldocument, status: :created, location: @legaldocument
    else
      render json: @legaldocument.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /legaldocuments/1
  def update
    if @legaldocument.update(legaldocument_params)
      render json: @legaldocument
    else
      render json: @legaldocument.errors, status: :unprocessable_entity
    end
  end

  # DELETE /legaldocuments/1
  def destroy
    @legaldocument.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legaldocument
      @legaldocument = Legaldocument.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def legaldocument_params
      params.require(:legaldocument).permit(:image, :fromuser, :user, :user_id, :legaldocument)
    end
end
