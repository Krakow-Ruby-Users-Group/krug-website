module Events
  class AttributesService
    def initialize(event)
      @event = event
    end

    def call
      return if event.blank?

      attributes
    end

    private

    attr_reader :event

    def attributes
      {
        meetup_id: event['id'],
        name: event['name'],
        rsvp_limit: event['rsvp_limit'],
        status: status,
        time: convert_time(event['time']),
        created: convert_time(event['created']),
        link: event['link'],
        description: event['description'],
        venue: venue
      }
    end

    def venue
      raw_venue = event['venue']
      return '' unless raw_venue

      "#{raw_venue['name']}, #{raw_venue['address_1']}"
    end

    def convert_time(miliseconds)
      Time.at(miliseconds / 1000)
    end

    def status
      Event.statuses[event['status']]
    end
  end
end
