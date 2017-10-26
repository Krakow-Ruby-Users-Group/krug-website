module Events
  # The service responsible for importing events from meetup api
  class FetchRemoteService
    include HTTParty
    base_uri 'https://api.meetup.com/'
    # KRUG name on meetup
    URLNAME = 'Krakow-Ruby-Users-Group'.freeze

    def call
      raw_events
    end

    private

    def options
      @options ||= { query: { status: status } }
    end

    def status
      'past,upcoming'
    end

    # Makes remote call for meetup.com api and returns KRUG events
    def raw_events
      self
        .class
        .get("/#{URLNAME}/events/", options)
        .parsed_response
    end
  end
end
