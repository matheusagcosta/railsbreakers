require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe "is_authenticated_in?" do

    context "readability" do

      context "with credentials" do
        before do
          expect(session).to receive(:[]).with(:readability_token).and_return("mytoken")
          expect(session).to receive(:[]).with(:readability_secret).and_return("mysecret")
        end

        it { expect(helper.is_authenticated_in?(:readability)).to be true }
      end

      context "without credentials" do
        it { expect(helper.is_authenticated_in?(:readability)).to be false }
      end
    end

    context "unknow provider" do
      it { expect{ helper.is_authenticated_in?(:foo) }.to raise_error("Unknow provider foo") }
    end
  end
end

