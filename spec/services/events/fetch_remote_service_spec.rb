require 'rails_helper'

describe Events::FetchRemoteService do
  subject(:service) { Events::FetchRemoteService.new }

  describe 'call' do
    it 'calls remote server and returns collection of raw events' do
      VCR.use_cassette 'events/raw_events2' do
        events = service.call
        expect(events.count).to eq 3

        event = events.first

        event.keys.each do |key|
          expect(event[key]).not_to be_nil
        end
      end
    end
  end
end
