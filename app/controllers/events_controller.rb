# Events controller
class EventsController < ApplicationController
  def index
    @events = Event.order('created_at DESC').page(params[:page])
  end

  def show
    @event = Event.find(params[:id])
    @previous_events = Event.where(id: previous_events_ids).reverse
  end

  private

  # Returns 3 previous events ids
  def previous_events_ids
    id = params[:id].to_i
    ((id - 3)..(id - 1))
  end
end
