class PagesController < ApplicationController
  def step1
  end

  def pocket_login
    session[:code] = Pocket.get_code(:redirect_uri => pocket_callback_url)
    new_url = Pocket.authorize_url(:code => session[:code], :redirect_uri => pocket_callback_url)
    redirect_to new_url
  end

  def pocket_callback
    result = Pocket.get_result(session[:code], :redirect_uri => pocket_callback_url)
    session[:pocket_access_token] = result['access_token']
    redirect_to root_path, notice: "Authenticated on Pocket"

  rescue Faraday::ClientError
    redirect_to root_path, alert: "Failed to authenticate on Pocket"
  end
end
