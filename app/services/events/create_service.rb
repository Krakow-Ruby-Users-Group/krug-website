module Events
  class CreateService
    def initialize(raw_events)
      @raw_events = raw_events
    end

    def call
      return if raw_events.blank?

      create_events!
    end

    private

    attr_reader :raw_events

    def create_events!
      Event.create!(new_events_attrs)
    end

    def events_attrs
      raw_events.map &method(:attributes_for)
    end

    def existing_events_ids
      @existing_events_ids ||= Event.pluck(:meetup_id)
    end

    def new_events_attrs
      events_attrs.delete_if do |attrs|
        existing_events_ids.include? attrs[:meetup_id]
      end
    end

    def attributes_for(event)
      AttributesService.new(event).call
    end
  end
end
