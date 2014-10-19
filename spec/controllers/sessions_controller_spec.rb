require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:readability]
  end

  describe "GET 'create'" do
    before do
      get :create, provider: :readability
    end

    it { should set_session(:readability_secret).to("mysecret") }
    it { should set_session(:readability_token).to("mytoken") }
    it { should redirect_to(root_path) }
    it { should set_the_flash.to("Authenticated on Readability") }
  end

  describe "GET 'failure'" do
    before do
      get :failure
    end

    it { should redirect_to(root_path) }
    it { should set_the_flash.to("Failed to authenticate on Readability") }
  end

end
