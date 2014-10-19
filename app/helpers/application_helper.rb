module ApplicationHelper
  def is_authenticated_in?(provider)
    case provider
    when :readability
      session[:readability_token].present? && session[:readability_secret].present?
    else
      raise "Unknow provider #{provider}"
    end
  end
end
