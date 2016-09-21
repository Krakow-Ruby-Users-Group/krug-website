# Admin User
AdminUser.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password"
)

# Events
# it download all KRUG events from meetup
EventsService.new.call

# Sponsors
Sponsor.create!(
  name: 'Codecool',
  url: 'https://codecool.pl/',
  logo: 'https://codecool.pl/wp-content/themes/codecool_v2_pl/assets/images/logo@2x.png',
  description: 'Beer, other drinks, sweets'
)

Sponsor.create!(
  name: 'MySQUAR',
  url: 'http://mysquar.com/',
  logo: 'http://mysquar.com/common/com-header/images/logo.icon.png',
  description: 'Beer, other drinks, sweets'
)

Sponsor.create!(
  name: 'Polcode',
  url: 'http://www.polcode.com/',
  logo: 'http://photos3.meetupstatic.com/photos/sponsor/2/e/8/2/iab120x90_2591906.jpeg',
  description: 'Beer, other drinks, sweets'
)

Sponsor.create!(
  name: 'AKRA Polska',
  url: 'http://akra.net/',
  logo: 'http://akra.net/uploads/images/akra-logo.png',
  description: 'Beer, other drinks, sweets'
)

Sponsor.create!(
  name: 'Codest',
  url: 'http://codesthq.com/',
  logo: 'http://codesthq.com/images/logo.svg',
  description: 'Beer, other drinks, sweets'
)

Sponsor.create!(
  name: 'InFakt',
  url: 'https://www.infakt.pl/',
  logo: 'http://photos2.meetupstatic.com/photos/sponsor/7/7/2/6/iab120x90_2070502.jpeg',
  description: 'Beer, other drinks, sweets'
)
