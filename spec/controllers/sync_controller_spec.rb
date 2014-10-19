require 'rails_helper'

RSpec.describe SyncController, :type => :controller do

  describe "GET create" do
    def action
      post :create
    end

    context "authenticated at least in 2 services" do
      before do
        expect(controller).to receive(:is_authenticated_in?).with(:pocket).and_return(true)
        expect(controller).to receive(:is_authenticated_in?).with(:readability).and_return(true)
        expect_any_instance_of(SyncReadersService).to receive(:sync!)
      end

      before { action }

      it { should redirect_to(root_path) }
      it { should set_the_flash.to("Services are synchronized") }
    end

    context "without enough services" do
      before do
        expect(controller).to receive(:is_authenticated_in?).with(:pocket).and_return(false)
        expect_any_instance_of(SyncReadersService).to_not receive(:sync!)
      end

      before { action }
      it { should redirect_to(root_path) }
      it { should set_the_flash.to("Cannot synchronize services, you must be authenticated at least in 2 services") }
    end
  end

end
