require 'rails_helper'

class FakeProvider
  attr_reader :added_links, :links, :added_links

  def initialize(name, links)
    @name = name
    @links = links
    @added_links = []
  end

  def add_link(link)
    @added_links << link
  end
end

RSpec.describe SyncReadersService, :type => :service do

  describe ".sync!" do
    let(:provider_a) do
      FakeProvider.new(:a, ["foo.com", "bar.com"])
    end

    let(:provider_b) do
      FakeProvider.new(:b, ["lorem.com", "ipsum.com", "bar.com"])
    end

    let(:providers) { [provider_a, provider_b] }

    before do
      described_class.new(providers).sync!
    end

    it { expect(provider_a.added_links).to eq(["lorem.com", "ipsum.com"]) }
    it { expect(provider_b.added_links).to eq(["foo.com"]) }
  end
end
