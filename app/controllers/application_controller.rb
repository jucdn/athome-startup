class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  before_action :redirect_to_prefered_host
  before_action :authenticate_user!
  before_action :set_raven_context

  protect_from_forgery with: :exception

  layout :layout_by_resource


    private

    def set_raven_context
      Raven.user_context(
        id: current_user.try(:id),
        email: current_user.try(:email)
      ) # or anything else in session
      Raven.extra_context(params: params.to_unsafe_h, url: request.url)
    end
    
    def user_not_authorized(exception)
      policy_name = exception.policy.class.to_s.underscore
      flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
      redirect_to(request.referrer || root_path)
    end

    def redirect_to_prefered_host
      if Rails.env.production? && request.host != ENV['DOMAIN_NAME']
        redirect_to(:host => ENV['DOMAIN_NAME'])
      end
    end
    
  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
