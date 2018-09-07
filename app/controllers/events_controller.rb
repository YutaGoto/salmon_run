class EventsController < ApplicationController
  def index
    @events = Event.all.includes(:stage, :weapons).order(:id)
    @opening_event = @events.open
  end
end
