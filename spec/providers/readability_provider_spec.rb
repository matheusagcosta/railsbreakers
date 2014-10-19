require 'rails_helper'

RSpec.describe ReadabilityProvider, :type => :provider do
  subject do
    described_class.new('LXSUxcxGASBgMHsSZD', '4nE5UtGMuVwnxwSCuRRM3udUJTXMhuAg')
  end

  describe "#links", :vcr do
    it { expect(subject.links).to eq(["http://www.akitaonrails.com/2010/07/19/screencast-comecando-com-vim"]) }
  end

  describe "#add_link", vcr: { cassette_name: "ReadabilityProvider/_add_link" } do
    let(:result) do
      { "article_id" => "ch9hmdt9", "bookmark_id" => "78274981", "status" => "202" }
    end

    it { expect(subject.add_link("www.google.com")).to eq(result) }
  end
end
