# Events controller
class EventsController < ApplicationController
  caches_action :index, expires_in: 3.hours

  def index
    @events = EventsService.new.call.page(params[ :page])
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
