# PingMeMaybe

PingMeMaybe is a small library to be used in conjunction with [Cronut](https://github.com/harrystech/cronut), a dead man's switch server implementation in Rails. 

## Installation

Add this line to your application's Gemfile:

    gem 'ping_me_maybe'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ping_me_maybe

## Usage

PingMeMaybe allows you to ping your Cronut server in jobs that Cronut monitors. To use PingMeMaybe start by adding the Ping ID you wish to ping from your Cronut server as a variable to your Resque job. Then simply invoke the class method `.ping_cronut` on PingMeMaybe, passing it the Cronut Ping ID. Example:

```ruby

    class SomeResqueJob
        @queue = :some_queue
        CRONUT_PING_ID = 'ABCD1234'
        
        def self.perform(some_object_id)
			begin
			    ...
			    PingMeMaybe.ping_cronut(CRONUT_PING_ID)
			    ...
			 rescue StandardError => e
			     Rails.logger.error(e.inspect)
			     raise
			 end
        end
    end
```

## Contributing

1. Fork it ( https://github.com/harrystech/ping-me-maybe/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
