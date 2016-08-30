# The service responsible for importing events from meetup api
class EventsService
  include HTTParty
  base_uri 'https://api.meetup.com/'
  URLNAME = 'Krakow-Ruby-Users-Group'.freeze

  def call
    events_hash = call_meetup
    events_hash.each { |event| import_event(event) }
  end

  private

  def import_event(hash)
    event = event_hash(hash)
    return if Event.find_by(meetup_id: event[:meetup_id])
    Event.create(event)
  end

  def call_meetup
    self.class.get("/#{URLNAME}/events/", options)
  end

  def options
    { query: { status: 'past,upcoming' } }
  end

  def event_hash(response)
    {
      meetup_id: response['id'],
      name: response['name'],
      description: response['description'],
      rsvp_limit: response['rsvp_limit'],
      status: Event.statuses[response['status']],
      link: response['link'],
    }
  end
end
