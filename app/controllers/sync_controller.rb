class SyncController < ApplicationController

  def create
    if authenticated_providers.size > 1
      SyncReadersService.new(authenticated_providers).sync!
      flash[:title] = "Now check it out in your readers"
      redirect_to root_path, notice: "Services are synchronized"
    else
      redirect_to root_path, notice: "Cannot synchronize services, you must be authenticated at least in 2 services"
    end
  end
end
