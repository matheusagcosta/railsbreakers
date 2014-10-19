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
      if is_authenticated_in?(:readability)
        providers << ReadabilityProvider.new(session[:readability_token], session[:readability_secret])
      elsif is_authenticated_in?(:pocket)
        # providers << PocketProvider.new()
      end
      providers
    end
end
