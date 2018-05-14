class EventsController < ApplicationController
  def index
    @events = Event.all.includes(:stage, :weapons)
  end
end
