class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  protect_from_forgery with: :exception
  rescue_from Exception, with: :handle_500
  rescue_from ActionController::RoutingError, with: :handle_404
  rescue_from ActiveRecord::RecordNotFound,   with: :handle_404

  def handle_500(exception = nil)
    logger.info "Rendering 500 with exception: #{exception.message}" if exception

    if request.xhr?
      render json: { error: '500 error' }, status: 500
    else
      render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
    end
  end

  def handle_404(exception = nil)
    logger.info "Rendering 404 with exception: #{exception.message}" if exception

    if request.xhr?
      render json: { error: '404 error' }, status: 404
    else
      render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
    end
  end

  private

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def login_required
      redirect_to login_path unless current_user
    end
end
