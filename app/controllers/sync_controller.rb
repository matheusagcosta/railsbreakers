class SyncController < ApplicationController
  def create
    if is_authenticated_in?(:pocket) && is_authenticated_in?(:readability)
      SyncReadersService.new(authendicated_providers).sync!
      redirect_to root_path, notice: "Services are synchronized"
    else
      redirect_to root_path, notice: "Cannot synchronize services, you must be authenticated at least in 2 services"
    end
  end

  private
    def authendicated_providers
      providers = []
      providers << ReadabilityProvider.new(session[:readability_token], session[:readability_secret]) if is_authenticated_in?(:readability)
      providers << PocketProvider.new(session[:pocket_access_token]) if is_authenticated_in?(:pocket)
      providers
    end
end
