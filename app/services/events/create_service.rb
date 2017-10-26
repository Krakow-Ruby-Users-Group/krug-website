module Events
  # The service responsible for creating new events
  class CreateService
    def initialize(raw_events)
      @raw_events = raw_events
    end

    def call
      Event.create!(new_events_attrs)
    end

    private

    attr_reader :raw_events

    def events_attrs
      raw_events.map { |event| event_attrs(event) }
    end

    def existing_events_ids
      @existing_events_ids ||= Event.pluck(:meetup_id)
    end

    def new_events_attrs
      events_attrs.delete_if do |attrs|
        existing_events_ids.include?(attrs[:meetup_id])
      end
    end

    def event_attrs(response)
      {
        meetup_id: response['id'],
        name: response['name'],
        rsvp_limit: response['rsvp_limit'],
        status: Event.statuses[response['status']],
        time: to_time(response['time']),
        created: to_time(response['created']),
        link: response['link'],
        description: response['description'],
        venue: venue(response['venue'])
      }
    end

    def venue(raw_venue)
      return '' unless raw_venue
      "#{raw_venue['name']}, #{raw_venue['address_1']}"
    end

    def to_time(milliseconds)
      Time.at(milliseconds / 1000)
    end
  end
end
