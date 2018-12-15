class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.joins(room: :building).where(start_at: params[:start]..params[:end]).where("buildings.id = ?", params[:building])
  end

  def show
  end

  def new
    @event = Event.new
    authorize @event
  end

  def edit
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    if is_available?(@event)
      @event.save
      flash[:success] = 'Réservation créée'
    else
      flash[:alert] = 'Salle occupée'
    end
  end

  def update
    @new_event = Event.new(event_params)
    authorize @event
    if is_updatable?(@new_event, @event)
      @event.update(event_params)
      flash[:success] = 'Réservation modifiée'
    else
      flash[:alert] = 'Salle occupée'
    end
  end

  def destroy
    authorize @event
    @event.destroy
    flash[:success] = 'Réservation supprimée'
  end


  def is_available?(event)
    available = 0

    if event.room_id.nil?
      return false
    end

    events = Event.where("start_at > ? AND start_at < ? AND  room_id = ?", event.start_at, event.end_at, event.room.id)
    if events.empty?
      available += 1
    end

    events = Event.where("end_at > ? AND end_at < ? AND  room_id = ?", event.start_at, event.end_at, event.room.id)
    if events.empty?
      available += 1
    end

    events = Event.where("start_at <= ? AND end_at >= ? AND  room_id = ?", event.start_at, event.end_at, event.room.id)
    if events.empty?
      available += 1
    end

    if available == 3
      return true
    else
      return false
    end
  end

  def is_updatable?(new_event, old_event)
    available = 0

    if new_event.room_id.nil?
      return false
    end

    events = Event.where("start_at > ? AND start_at < ? AND  room_id = ? AND id <> ?", new_event.start_at, new_event.end_at, new_event.room.id, old_event.id)
    if events.empty?
      available += 1
    end

    events = Event.where("end_at > ? AND end_at < ? AND  room_id = ? AND id <> ?", new_event.start_at, new_event.end_at, new_event.room.id, old_event.id)
    if events.empty?
      available += 1
    end

    if available == 2
      return true
    else
      return false
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start_at, :end_at, :user_id, :room_id)
    end

end
