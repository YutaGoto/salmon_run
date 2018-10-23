class Api::EventsController < Api::ApplicationController
  def index
    @events = if params[:stages].present? || params[:weapons].present?
                Event.includes(:stage, :weapons).by_weapon_id(params[:weapons]).by_stage_id(params[:stages]).order(:id)
              else
                Event.includes(:stage, :weapons).all.order(:id)
              end
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def open
    @opening_event = Event.opening.last
    @is_open = @opening_event.present?
    render 'oepn', formats: 'json', handlers: 'jbuilder'
  end
end
