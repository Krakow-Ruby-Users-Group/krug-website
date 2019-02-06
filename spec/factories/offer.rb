# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    sponsor { nil }
    title { 'Ruby on Rails developer' }
    description { 'Looking for programming rockstars' }

    trait :with_sponsor do
      sponsor
    end
  end
end
