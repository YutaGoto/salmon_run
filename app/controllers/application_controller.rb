class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from Exception, with: :render_500 unless Rails.env.development?
  rescue_from InputErrorException, with: :render_400
  rescue_from AuthorityException, with: :render_401
  rescue_from NotFoundException, with: :render_404
  rescue_from GoneException, with: :render_410
  rescue_from ApplicationException, with: :render_500
  rescue_from MaintenanceException, with: :render_503

  def render_400(exception = nil)
    @error_message = exception.try(:message)
    render 'common/errors/400', status: :bad_request
  end

  def render_401(exception = nil)
    @error_message = exception.try(:message)
    render 'common/errors/401', status: :unauthorized
  end

  def render_404(exception = nil)
    @error_message = exception.try(:message)
    render 'common/errors/404', status: :not_found
  end

  def render_410(exception = nil)
    @error_message = exception.try(:message)
    render 'common/errors/410', status: :gone
  end

  def render_500(exception)
    @error_message = exception.message
    render 'common/errors/500', status: :internal_server_error
  end

  def render_503(exception = nil)
    @error_message = exception.try(:message)
    render 'common/errors/503', status: :service_unavailable
  end
end
