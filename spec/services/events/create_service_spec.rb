require 'rails_helper'

describe Events::CreateService do
  subject(:service) { Events::CreateService.new(events) }
  let(:fixture) { file_fixture('events.json').read }
  let(:events) { JSON.parse(fixture) }

  describe 'call' do
    context 'When there are no events' do
      let(:events) { [] }

      it 'doesnt create any events' do
        expect { service.call }
          .to  change(Event, :count).by(0)
      end
    end

    context 'When there are no new events' do
      let!(:existing_event1) { create(:event, meetup_id: '99860482') }
      let!(:existing_event2) { create(:event, meetup_id: '107347882') }

      it 'doesnt create any events' do
        expect { service.call }
            .to  change(Event, :count).by(0)
      end
    end

    context 'When there are new events' do
      it 'creates new events' do
        expect { service.call }
            .to  change(Event, :count).by(2)
      end
    end
  end
end
