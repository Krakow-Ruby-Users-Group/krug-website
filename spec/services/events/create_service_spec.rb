require 'rails_helper'

describe Events::CreateService do
  subject(:service) { described_class.new(events) }

  let(:fixture) { file_fixture('events.json').read }
  let(:events) { JSON.parse(fixture) }

  describe 'call' do
    context 'when there are no events' do
      let(:events) { [] }

      it 'doesnt create any events' do
        expect { service.call }.to  change(Event, :count).by(0)
      end
    end

    context 'when there are no new events' do
      it 'doesnt create any events' do
        create(:event, meetup_id: '99860482')
        create(:event, meetup_id: '107347882')

        expect { service.call }.to  change(Event, :count).by(0)
      end
    end
    context 'when there are new events' do
      it 'creates new events' do
        expect { service.call }.to  change(Event, :count).by(2)
      end
    end
  end
end
