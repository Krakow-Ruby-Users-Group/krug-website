# KRUG Website
  Rails 5.0 website of Kraków Ruby Users Group

## Installation

```bash
git clone git@github.com:Krakow-Ruby-Users-Group/krug-website.git

cd krug-website

cp config/database.yml.example config/database.yml

bundle install

bundle exec rake db:create

bundle exec rake db:migrate
```

[![coditsu](https://coditsu.io/assets/quality_bar.svg)](https://app.coditsu.io/krakow-ruby-users-group/repositories/krug-website/builds/commit_builds)
