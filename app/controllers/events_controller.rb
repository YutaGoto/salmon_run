class EventsController < ApplicationController
  def index
    @events = Event.all.includes(:stage, :weapons).order(:id)
  end
end
