module Api
  class EventsController < Api::ApplicationController
    def index
      weapon = weapon_search
      @events = Event.includes(:stage, :weapons).by_weapon(weapon).by_stage_id(params[:stages]).order(:id)
      render 'index', formats: :json, handlers: 'jbuilder'
    end

    def open
      @opening_event = Event.opening.last
      @is_open = @opening_event.present?
      render 'open', formats: :json, handlers: 'jbuilder'
    end

    def show
      @event = Event.find(params[:id])
      render 'show', formats: :json, handlers: 'jbuilder'
    end

    def weapon_search
      Weapon.weapon_search(params[:weapons]).first
    end
  end
end
