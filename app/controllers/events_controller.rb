# Events controller
class EventsController < ApplicationController
  def index
    @events = Event.order('created_at DESC').page(params[:page])
  end

  def show
    id = params[:id].to_i
    @event = Event.find(id)
    @events = Event.where(id: ((id-3)..(id-1)))
  end
end
