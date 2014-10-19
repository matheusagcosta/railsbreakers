require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  describe "GET step1" do
    it "returns http success" do
      get :step1
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET step2" do
    it "returns http success" do
      get :step2
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET step3" do
    it "returns http success" do
      get :step3
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET pocket_login", :vcr do
    before { get :pocket_login }
      
    context 'common' do
      it { expect(response).to have_http_status(:redirect) }
    end
  end

  describe "GET pocket_callback", :vcr do
    
    context 'common' do
      let(:access_token) { '123412341234' }
      before do
        expect_any_instance_of(Pocket::Client).to receive(:get_result).and_return('access_token' => access_token)
        get :pocket_callback
      end

      it { should redirect_to(root_path) }
      it { should set_session(:pocket_access_token).to(access_token) }
    end

    context 'not autorized' do
      before { 
        get :pocket_callback, {}, { code: "1dac83e1-fa2d-5ae1-d2c1-821350" }
      }

      it { should redirect_to(root_path) }

    end

  end

end
