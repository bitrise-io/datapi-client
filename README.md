# Datapi::Client

Client for [DatAPI](https://github.com/bitrise-tools/datapi).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'datapi-client', '~> 0.1.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install datapi-client

## Usage

Store data:

```
datapi_store = Datapi::Client::StoreData.new(datapi_root_url, datapi_read_write_api_token)
sample_data = { 'label' => 'sample_data', 'value' => true }
datapi_store.send(sample_data, 'unit-test')
```

Get data:

```
datapi_get = Datapi::Client::GetData.new(datapi_root_url, datapi_readonly_api_token)
datapi_get.get_data_by_typeid('unit-test')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bitrise-tools/datapi-client.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

