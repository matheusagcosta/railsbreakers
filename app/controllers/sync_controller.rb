class SyncController < ApplicationController
  def create
    SyncReadersService.new(providers).sync!
    redirect_to root_path
  end

  private
    def providers
      []
    end
end
