module Events
  class FetchRemoteService
    include HTTParty
    base_uri 'https://api.meetup.com/'
    URLNAME = 'Krakow-Ruby-Users-Group'.freeze

    def initialize(page: 3)
      @page = page
    end

    def call
      raw_events
    end

    private

    attr_reader :page

    def raw_events
      FetchRemoteService
        .get("/#{URLNAME}/events/", options)
        .parsed_response
    end

    def options
      @options ||= Hash[query: query]
    end

    def query
      { status: 'past,upcoming', page: page }
    end
  end
end
