# frozen_string_literal: true

FactoryBot.define do
  factory :sponsor do
    name { 'Sponsor' }
    url { 'https://krug.org.pl' }
    description { 'Best RUG in Poland' }
    logo do
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec/support/sponsor_logo.png'),
        'image/png'
      )
    end
  end
end
