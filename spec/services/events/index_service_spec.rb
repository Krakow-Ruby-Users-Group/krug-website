require 'rails_helper'

describe Events::IndexService do
  subject(:service) { described_class.new }

  describe 'call' do
    let(:existing_event1) { create(:event, meetup_id: '109844542') }

    context 'when there are no new events' do
      let(:existing_event2) { create(:event, meetup_id: '107347882') }
      let(:existing_event3) { create(:event, meetup_id: '99860482') }

      it 'returns all events from databse' do
        VCR.use_cassette 'events/raw_events' do
          expect(service.call.pluck(:meetup_id)).to match_array %w[109844542 107347882 99860482]
        end
      end
    end

    context 'when there are new events' do
      it 'calls remote server and updates db with new events and then returns them all' do
        VCR.use_cassette 'events/raw_events' do
          expect(service.call.pluck(:meetup_id)).to match_array %w[109844542 107347882 99860482]
        end
      end
    end
  end
end
