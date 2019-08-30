class EventsController < ApplicationController
  def index
    raise MaintenanceException, 'MaintenanceException'
  end

  def show; end
end
