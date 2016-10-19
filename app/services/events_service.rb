# The service responsible for importing events from meetup api
class EventsService
  include HTTParty
  base_uri 'https://api.meetup.com/'
  # KRUG name on meetup
  URLNAME = 'Krakow-Ruby-Users-Group'.freeze

  # Triggers meetup events import
  def call
    events.each { |event| import_event(event) }
  end

  private

  # Creates new event and save it to database unless it already exists
  # @param hash [Hash]
  def import_event(hash)
    event = event_hash(hash)
    return if Event.find_by(meetup_id: event[:meetup_id])
    Event.create(event)
  end

  # Makes remote call for meetup.com api and returns KRUG events
  def events
    self.class.get("/#{URLNAME}/events/", options)
  end

  # Prepares options needed for events call
  # @return [Hash]
  def options
    { query: { status: 'past,upcoming' } }
  end

  # Prepares hash for single event
  # @param response [Hash]
  # @return [Hash]
  def event_hash(response)
    {
      meetup_id: response['id'],
      name: response['name'],
      rsvp_limit: response['rsvp_limit'],
      status: Event.statuses[response['status']],
      time: prepare_time(response['time']),
      created: prepare_time(response['created']),
      link: response['link'],
      description: response['description'],
      venue: prepare_venue(response['venue'])
    }
  end

  # Flattens venue hash
  # @param venue_hash [Hash]
  # @return [String]
  def prepare_venue(venue_hash)
    return '' unless venue_hash
    "#{venue_hash['name']}, #{venue_hash['address_1']}"
  end

  # Converts milisecond to Time
  # @param milliseconds [Integer]
  # @return [Time]
  def prepare_time(milliseconds)
    Time.at(milliseconds / 1000)
  end
end
