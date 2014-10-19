require 'rails_helper'

RSpec.describe PocketProvider do

  describe "initialize" do
    it "does set provider links" do
      provider = PocketProvider.new(['foo.com', 'lelek.com.br'])
      expect(provider.links).to eq(['foo.com', 'lelek.com.br'])
    end
  end
end
