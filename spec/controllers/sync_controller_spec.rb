require 'rails_helper'

RSpec.describe SyncController, :type => :controller do

  describe "GET create" do
    def action
      post :create
    end

    context "authenticated at least in 2 services" do
      before do
        expect(controller).to receive(:authenticated_providers).at_least(1).and_return([FakeProvider.new, FakeProvider.new])
        expect_any_instance_of(SyncReadersService).to receive(:sync!)
      end

      before { action }

      it { should redirect_to(root_path) }
      it { should set_the_flash.to("Services are synchronized") }
    end

    context "without enough services" do
      before do
        expect(controller).to receive(:authenticated_providers).at_least(1).and_return([FakeProvider.new])
        expect_any_instance_of(SyncReadersService).to_not receive(:sync!)
      end

      before { action }
      it { should redirect_to(root_path) }
      it { should set_the_flash.to("Cannot synchronize services, you must be authenticated at least in 2 services") }
    end
  end

end
