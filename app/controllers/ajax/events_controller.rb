class Ajax::EventsController < ::ApplicationController
  layout false

  def index
    @events = Event.includes(:stage, :weapons).joins(:events_weapons).where(events_weapons: {weapon_id: params[:weapons].split(",")}).order(:id)
  end
end
