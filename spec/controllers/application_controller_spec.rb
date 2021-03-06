require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "is_authenticated_in?" do

    context "readability" do

      context "with credentials" do
        before do
          expect(session).to receive(:[]).with(:readability_token).and_return("mytoken")
          expect(session).to receive(:[]).with(:readability_secret).and_return("mysecret")
        end

        it { expect(controller.is_authenticated_in?(:readability)).to be true }
      end

      context "without credentials" do
        it { expect(controller.is_authenticated_in?(:readability)).to be false }
      end
    end

    context "pocket" do

      context "with credentials" do
        before do
          expect(session).to receive(:[]).with(:pocket_access_token).and_return("mytoken")
        end

        it { expect(controller.is_authenticated_in?(:pocket)).to be true }
      end

      context "without credentials" do
        it { expect(controller.is_authenticated_in?(:pocket)).to be false }
      end
    end

    context "unknow provider" do
      it { expect{ controller.is_authenticated_in?(:foo) }.to raise_error("Unknow provider foo") }
    end
  end
end
