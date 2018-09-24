class Api::EventsController < Api::ApplicationController
  def index
    @events = Event.all
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def open
    @opening_event = Event.opening.last
    @is_open = @opening_event.present?
    render 'oepn', formats: 'json', handlers: 'jbuilder'
  end
end
