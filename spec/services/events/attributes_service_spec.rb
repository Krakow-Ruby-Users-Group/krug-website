require 'rails_helper'

describe Events::AttributesService do
  subject(:service) { described_class.new(event) }

  let(:fixture) { file_fixture('event.json').read }
  let(:event) { JSON.parse(fixture) }

  describe 'call' do
    let(:expected_result) do
      {
        meetup_id: '99860482',
        name: 'Meeting #1/2013 - Push best, pull improvements and... YARVs hard work',
        rsvp_limit: 55,
        status: 0,
        time: Time.new(2013, 2, 5, 19),
        created: Time.new(2013, 1, 16, 11, 44, 25),
        link: 'https://www.meetup.com/Krakow-Ruby-Users-Group/events/99860482/',
        description: '<p>Speakers:...',
        venue: 'Klub Pauza (Floor -1 / underground), Floriańska 18'
      }
    end

    it 'returns parsed attributes for event' do
      expect(service.call).to eq expected_result
    end
  end
end
