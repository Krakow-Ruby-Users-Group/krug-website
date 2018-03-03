module Events
  class FetchRemoteService
    include HTTParty
    base_uri 'https://api.meetup.com/'
    URLNAME = 'Krakow-Ruby-Users-Group'.freeze

    def call
      raw_events
    end

    private

    def raw_events
      FetchRemoteService
        .get("/#{URLNAME}/events/", options)
        .parsed_response
    end

    def options
      @options ||= Hash[query: query]
    end

    def query
      { status: 'past,upcoming', page: 3 }
    end
  end
end
