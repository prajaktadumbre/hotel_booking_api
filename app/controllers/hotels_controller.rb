class HotelsController < ApplicationController
  def index
    if params[:location].present?
      hotels = Hotel.where(location: params[:location])
    else
      hotels = Hotel.all
    end
    render json: hotels
  end
end