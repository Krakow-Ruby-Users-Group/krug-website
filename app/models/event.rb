# Model representing single meetup event
class Event < ApplicationRecord
  include Bootsy::Container
  paginates_per 8
  enum status: { past: 0, upcoming: 1 }
end
