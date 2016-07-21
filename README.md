[![Build Status](https://travis-ci.org/lekishvili/remindrr-ruby.svg?branch=master)](https://travis-ci.org/lekishvili/remindrr-ruby)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'remindrr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install remindrr

## Usage

#### Reciving reminders

```ruby
require 'remindrr'

Remindrr::Reminder.on do |reminder|
  # TODO: process your reminder
end
```

#### Create reminders

```ruby
require 'remindrr'

Remindrr.configure do |config|
  config.client_secret = 'CLIENT_SECRET'
end

app = Remindrr::App.create(name: 'example', endpoint: 'http:://example.com')
reminder = Remindrr::Remindr.create(app, remind_at: Time.now, data: {})

```

### Run it

#### ...on Rack

Remindrr runs on Rack, so you hook it up like you would an ordinary web application:

```ruby
# config.ru
require 'remindrr'
require_relative 'listener'

run Remindrr::Server
```

### ..on Rails

Generate Remindrr initializer:

    $ rails generate remindrr

Mount routes:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  # ...

  mount Rmeindrr::Server, at: 'remindrr'
end
```

We suggest that you put your listener code in app/remindrrs

```ruby
# app/reminderrs/example.rb

Remindrr::Reminder.on do |reminder|
  # TODO: process your reminder
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lekishvili/remindrr.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

