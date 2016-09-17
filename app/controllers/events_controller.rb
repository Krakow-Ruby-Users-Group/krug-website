# Events controller
class EventsController < ApplicationController
  def index
    @events = Event.order('created_at DESC').page(params[:page])
  end

  def show
    @event = Event.find(params[:id])
  end
end
