require 'rails_helper'

RSpec.describe SyncController, :type => :controller do

  describe "GET create" do
    def action
      post :create
    end

    before do
      expect_any_instance_of(SyncReadersService).to receive(:sync!)
    end

    before { action }

    it { should redirect_to(root_path) }
  end

end
