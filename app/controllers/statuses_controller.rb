class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :update, :destroy]

  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.all

    render json: @statuses
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
    render json: @status
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(status_params)

    if @status.save
      render json: @status, status: :created, location: @status
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    @status = Status.find(params[:id])

    if @status.update(status_params)
      head :no_content
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status.destroy

    head :no_content
  end

  private

    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
      params.require(:status).permit(:temperature, :humidity)
    end
end
