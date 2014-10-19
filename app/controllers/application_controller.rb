class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  ensure_security_headers # See more: https://github.com/twitter/secureheaders

  helper_method :is_authenticated_in?

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
end
