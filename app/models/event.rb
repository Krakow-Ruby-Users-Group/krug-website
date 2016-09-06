# Model representing single meetup event
class Event < ApplicationRecord
  include Bootsy::Container
  enum status: { past: 0, upcoming: 1 }
end
