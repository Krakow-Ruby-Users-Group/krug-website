# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OffersHelper, type: :helper do
  describe '#offer_logo_url' do
    context 'when offer has sponsor' do
      it "returns sponsor's logo URL in thumb version" do
        offer = FactoryBot.build(:offer, :with_sponsor)
        url = helper.offer_logo_url(offer)
        expect(url).to include("/sponsor/logo/#{offer.sponsor.id}")
      end
    end

    context 'when offer has no sponsor' do
      it 'returns default URL for logo' do
        offer = FactoryBot.build(:offer)
        url = helper.offer_logo_url(offer)
        expect(url).to eq(LogoUploader.new.default_url)
      end
    end
  end
end
