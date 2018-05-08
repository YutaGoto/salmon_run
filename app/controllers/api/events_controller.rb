class Api::EventsController < Api::ApplicationController
  def index
    @events = Event.all
  end
end
