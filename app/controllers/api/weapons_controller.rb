class Api::WeaponsController < Api::ApplicationController
  def index
    @weapons = Weapon.all
    render 'index', formats: 'json', handlers: 'jbuilder'
  end
end
