class Ajax::EventsController < ::ApplicationController
  layout false

  def index
    @events = if params[:stages].present? || params[:weapons].present?
                Event.includes(:stage, :weapons).by_weapon_id(params[:weapons]).by_stage_id(params[:stages]).order(:id)
              else
                Event.includes(:stage, :weapons).all.order(:id)
              end
  end
end
