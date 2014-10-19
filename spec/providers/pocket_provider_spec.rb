require 'rails_helper'

RSpec.describe PocketProvider do
  let!(:provider) { PocketProvider.new(['foo.com', 'lelek.com.br']) }

  describe "initialize" do
    it "does set provider links" do
      expect(provider.links).to eq(['foo.com', 'lelek.com.br'])
    end
  end

  describe "#add_link" do
    it "does add links to added_links" do
      provider.add_link('railsrumble.com')
      expect(provider.added_links).to eq(['railsrumble.com'])
    end
  end
end
