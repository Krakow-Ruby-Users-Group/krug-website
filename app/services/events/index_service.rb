module Events
  # The service responsible for listing events from meetup api
  class IndexService
    def call
      update_events_information
      events
    end

    private

    def update_events_information
      Rails.cache.fetch('meetup_events', expires_in: 3.hours) do
        raw_events = FetchRemoteService.new.call

        CreateService.new(raw_events).call
      end
    end

    def events
      Event.sorted
    end
  end
end
