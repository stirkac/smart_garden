class StatusesController < ApplicationController
  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.last_day
    render json: @statuses
  end

  # GET /statuses/current
  # GET /statuses/current.json
  def current
    @status = Status.last
    render json: @status
  end
end
