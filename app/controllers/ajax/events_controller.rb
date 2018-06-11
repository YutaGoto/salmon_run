class Ajax::EventsController < ::ApplicationController
  layout false

  def index
    @events = if params[:weapons].present?
                Event.includes(:stage, :weapons).by_weapon_ids(params[:weapons].split(',')).order(:id)
              else
                Event.includes(:stage, :weapons).all.order(:id)
              end
  end
end
