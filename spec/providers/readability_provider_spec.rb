require 'rails_helper'

RSpec.describe ReadabilityProvider, :type => :provider do
  subject do
    described_class.new('LXSUxcxGASBgMHsSZD', '4nE5UtGMuVwnxwSCuRRM3udUJTXMhuAg')
  end

  describe "#links", :vcr do
    it { expect(subject.links).to eq(["http://www.akitaonrails.com/2010/07/19/screencast-comecando-com-vim"]) }
  end
end
