class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  ensure_security_headers # See more: https://github.com/twitter/secureheaders

  helper_method :is_authenticated_in?
  helper_method :authenticated_providers

  def is_authenticated_in?(provider)
    case provider
    when :readability
      session[:readability_token].present? && session[:readability_secret].present?
    when :pocket
      session[:pocket_access_token].present?
    else
      raise "Unknow provider #{provider}"
    end
  end

  def authenticated_providers
    authenticated_providers = []
    authenticated_providers << ReadabilityProvider.new(session[:readability_token], session[:readability_secret]) if is_authenticated_in?(:readability)
    authenticated_providers << PocketProvider.new(session[:pocket_access_token]) if is_authenticated_in?(:pocket)
    authenticated_providers
  end
end

