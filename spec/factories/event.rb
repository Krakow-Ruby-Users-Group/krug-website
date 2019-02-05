# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    sequence(:meetup_id, 10) { |n| "9986048#{n}" }
    name { 'Meeting #1/2020 Name' }
    rsvp_limit { 120 }
    status { 'past' }
    time { 1.month.ago }
    created { 2.months.ago }
    link { 'https://www.meetup.com/' }
    description { 'Some description' }
    venue { 'Some Venue' }
  end
end
