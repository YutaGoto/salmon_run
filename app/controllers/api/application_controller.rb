class Api::ApplicationController < ApplicationController
  layout false
  rescue_from Exception, with: :render_500 if Rails.env.production?
  rescue_from InputErrorException, with: :render_400
  rescue_from AuthorityException, with: :render_401
  rescue_from NotFoundException, with: :render_404
  rescue_from ConflictException, with: :render_409
  rescue_from GoneException, with: :render_410
  rescue_from ApplicationException, with: :render_500
  rescue_from MaintenanceException, with: :render_503

  def render_400
    render status: '400', json: { message: e.message }
  end

  def render_401
    render status: '401', json: { message: e.message }
  end

  def render_404
    render status: '404', json: { message: e.message }
  end

  def render_409
    render status: '409', json: { message: e.message }
  end

  def render_410
    render status: '410', json: { message: e.message }
  end

  def render_500
    render status: '500', json: { message: e.message }
  end

  def render_503
    render status: '503', json: { message: e.message }
  end
end
