require 'spec_helper'

describe InpostApi do

  it 'has a version number' do
    expect(InpostApi::VERSION).not_to be(nil)
  end

  before do
    described_class.configure do |config|
      config.endpoint = 'https://api-pl.easypack24.net/v4/machines'
    end
  end

  context 'configuration' do
    it 'not be nil' do
      expect(described_class.configuration.endpoint).not_to be(nil)
    end

    it 'api_key should eq api_key_1' do
      expect(described_class.configuration.endpoint).to eq('https://api-pl.easypack24.net/v4/machines')
    end
  end

  context 'client' do
    describe '.get_inpost_lockers' do
      it 'when type present' do
        expect(described_class.get_inpost_lockers(type: 1).any?).to eq(true)
      end

      it 'when type blank (type=0)' do
        expect(described_class.get_inpost_lockers.any?).to eq(true)
      end

      it 'when type not exist' do
        expect(described_class.get_inpost_lockers(type: -1).any?).to eq(false)
      end
    end

    describe '.get_inpost_locker' do
      it 'when id exist' do
        expect(described_class.get_inpost_locker('BDO01A')).to eq(JSON.parse('{"_links":{"self":{"href":"/v4/machines/BDO01A"},"minimap":{"href":"http://maps.googleapis.com/maps/api/staticmap?size=800x400&center=51.26569,16.70733&zoom=15&markers=color:blue%7Clabel:X%7C51.26569,16.70733"}},"id":"BDO01A","type":0,"services":["parcel"],"payment_type":2,"address":{"street":"Aleje Jerozolimskie","building_no":"31","post_code":"56-120","city":"Brzeg Dolny","province":"dolnośląskie"},"status":"Operating","address_str":"Aleje Jerozolimskie 31, Brzeg Dolny","location":[51.26569,16.70733],"location_description":"Przy markecie Intermarche"}'))
      end

      it 'when id not exist' do
        expect(described_class.get_inpost_locker('fake_id')).to eq(nil)
      end
    end
  end

  context "caching" do
    before { Rails.cache.clear }

    describe 'get_inpost_lockers' do
      let(:key) { "#{described_class.configuration.endpoint}/type/1" }

      it do
        expect(Rails.cache.exist?(key)).to eq(false)
        described_class.get_inpost_lockers(type: 1)
        expect(Rails.cache.exist?(key)).to eq(true)
      end
    end

    describe 'get_inpost_locker' do
      let(:key) { "#{described_class.configuration.endpoint}/id/BDO01A" }

      it do
        expect(Rails.cache.exist?(key)).to eq(false)
        described_class.get_inpost_locker('BDO01A')
        expect(Rails.cache.exist?(key)).to eq(true)
      end
    end
  end
end
