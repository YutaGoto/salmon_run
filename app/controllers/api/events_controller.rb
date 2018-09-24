class Api::EventsController < Api::ApplicationController
  def index
    @events = Event.all
    render 'index', formats: 'json', handlers: 'jbuilder'
  end
end
