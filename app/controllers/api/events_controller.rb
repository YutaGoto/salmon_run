class Api::EventsController < Api::ApplicationController
  def index
    @events = Event.includes(:stage, :weapons).by_weapon_id(params[:weapons]).by_stage_id(params[:stages]).order(:id)
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def open
    @opening_event = Event.opening.last
    @is_open = @opening_event.present?
    render 'open', formats: 'json', handlers: 'jbuilder'
  end

  def show
    @event = Event.find(params[:id])
    render 'show', formats: 'json', handlers: 'jbuilder'
  end
end
