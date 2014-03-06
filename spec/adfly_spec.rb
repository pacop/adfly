require 'adfly'
require_relative 'spec_helper'

describe Adfly::API do
  
  let!(:adfly) { Adfly::API.new VALID_UID, VALID_KEY }

  describe "#initialize" do
    it "take two params" do
      expect { Adfly::API.new('') }.to raise_error(ArgumentError)
      expect { Adfly::API.new('', '') }.not_to raise_error
    end
  end

  describe "#create_link" do
    context 'with valid params' do
      it "return string" do
        expect(adfly.create_link(url: VALID_LINK)).to be_kind_of(String)
      end

      it "specifying advert_type or domain" do
        expect(adfly.create_link(url: VALID_LINK, advert_type: :int, domain: 'q.gs')).to be_kind_of(String)
      end

    end

    context 'with invalid params' do

      it "return ArgumentError if url is invalid" do
        expect { adfly.create_link(url: '') }.to raise_error(ArgumentError)
      end

    end

  end

end
