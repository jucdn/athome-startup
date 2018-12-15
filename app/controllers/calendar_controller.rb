class CalendarController < ApplicationController
  def show
    @building = Building.find(params[:id])
    authorize @building
    @rooms = Room.where("building_id = ?", params[:id])
  end
end
