class SessionsController < ApplicationController
  def create
    credentials = auth_hash["credentials"]
    session[:readability_token] = credentials["token"]
    session[:readability_secret] = credentials["secret"]
    redirect_to root_path, notice: "Authenticated on Readability"
  end

  def failure
    redirect_to root_path, alert: "Failed to authenticate on Readability"
  end

  protected
    def auth_hash
      request.env['omniauth.auth']
    end
end
