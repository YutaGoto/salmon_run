class Api::StagesController < Api::ApplicationController
  def index
    @stages = Stage.all
    render 'index', formats: 'json', handlers: 'jbuilder'
  end
end
