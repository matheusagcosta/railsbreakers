require 'rails_helper'

RSpec.describe PocketProvider, :type => :provider do
  let!(:provider) { PocketProvider.new('24ed0c7a-f288-ee0c-a662-677034') }

  describe "#links", :vcr do
    let(:result) do
      ["http://www.lowcarb-paleo.com.br/2014/09/ensaio-clinico-randomizado-low-carb_7.html", 
       "http://cedricruiz.me/blog/functional-coffeescript-for-the-impatient/", 
       "http://devblog.avdi.org/2008/02/23/why-monkeypatching-is-destroying-ruby/", 
       "http://codon.com/refactoring-ruby-with-monads?utm_content=buffer2eb47&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer", 
       "http://codon.com/programming-with-nothing"]
    end

    it "returns the links" do
      expect(provider.links).to eq(result)
    end
  end

  describe "#add_link", vcr: { cassette_name: "PocketProvider/_add_link" } do
    it "does add links to added_links" do
      expect(provider.add_link("http://railsrumble.com")["item"]["normal_url"]).to eq("http://railsrumble.com")
    end
  end
end
