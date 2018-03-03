require 'rails_helper'

describe Events::FetchRemoteService do
  subject(:service) { described_class.new }

  describe 'call' do
    it 'calls remote server and returns collection of raw events' do
      VCR.use_cassette 'events/raw_events' do
        event = service.call.first
        event.each_key { |key| expect(event[key]).not_to be_nil }
      end
    end
  end
end
