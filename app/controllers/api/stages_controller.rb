module Api
  class StagesController < Api::ApplicationController
    def index
      @stages = Stage.all
      render 'index', formats: 'json', handlers: 'jbuilder'
    end

    def show
      @stage = Stage.find(params[:id])
      @weapons = Weapon.all
      render 'show', formats: 'json', handlers: 'jbuilder'
    end
  end
end
