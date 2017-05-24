# Admin User
AdminUser.destroy_all

AdminUser.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password"
)

Sponsor.destroy_all

exit

# Events
# it download all KRUG events from meetup
EventsService.new.call

# Sponsors
Sponsor.create!(
  name: 'Codecool',
  url: 'https://codecool.pl/',
  remote_logo_url: 'https://codecool.pl/wp-content/themes/codecool_v2_pl/assets/images/logo@2x.png',
  description: 'Beer, other drinks, sweets'
)

Sponsor.create!(
  name: 'MySQUAR',
  url: 'http://mysquar.com/',
  remote_logo_url: 'http://mysquar.com/img/mysquar/mysquar-logo.png',
  description: 'Beer, other drinks, sweets'
)

Sponsor.create!(
  name: 'AKRA Polska',
  url: 'http://akra.net/',
  remote_logo_url: 'http://akra.net/uploads/images/akra-logo.png',
  description: 'Beer, other drinks, sweets'
)

Sponsor.create!(
  name: 'Codest',
  url: 'http://codesthq.com/',
  remote_logo_url: 'http://codesthq.com/images/logo.svg',
  description: 'Beer, other drinks, sweets'
)

Sponsor.create!(
  name: 'InFakt',
  url: 'https://www.infakt.pl/',
  remote_logo_url: 'http://photos2.meetupstatic.com/photos/sponsor/7/7/2/6/iab120x90_2070502.jpeg',
  description: 'Beer, other drinks, sweets'
)

10.times do
  Offer.create!(
    title: "#{Faker::Hacker.adjective} #{Faker::Hacker.adjective}",
    sponsor_id: Sponsor.pluck(:id).sample,
    description: Faker::Hacker.say_something_smart
  )
end
