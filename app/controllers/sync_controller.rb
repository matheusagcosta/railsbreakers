class SyncController < ApplicationController
  def create
    if is_authenticated_in?(:pocket) && is_authenticated_in?(:readability)
      SyncReadersService.new(providers).sync!
      redirect_to root_path, notice: "Services are synchronized"
    else
      redirect_to root_path, notice: "Cannot synchronize services, you must be authenticated at least in 2 services"
    end
  end

  private
    def providers
      []
    end
end
