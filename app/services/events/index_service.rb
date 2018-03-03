module Events
  class IndexService
    def call
      update_events_information!

      events
    end

    private

    def update_events_information!
      return if raw_events.blank?

      CreateService.new(raw_events).call
    end

    def raw_events
      FetchRemoteService.new.call
    end

    def events
      Event.sorted
    end
  end
end
