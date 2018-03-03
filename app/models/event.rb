# Model representing single meetup event
class Event < ApplicationRecord
  include Bootsy::Container

  enum status: { past: 0, upcoming: 1 }

  paginates_per 8

  scope :sorted, -> { order(time: :asc) }
end
