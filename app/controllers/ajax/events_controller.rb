class Ajax::EventsController < ::ApplicationController
  layout false

  def index
    if params[:weapons].present?
      @events = Event.includes(:stage, :weapons).by_weapon_ids(params[:weapons].split(",")).order(:id)
    else
      @events = Event.includes(:stage, :weapons).all.order(:id)
    end
  end
end
