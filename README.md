# SequelErd

Creates ERD (Entity-Relationship-Models) from Sequel Models. This is a quite hacky project without any real specs. Hope these will follow.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sequel_erd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sequel_erd

## Usage

Run ```ruby
Sequel::Erd.create
```
after loading your Application Code and Models (e.g. from the CLI). This will create a sequel_erd.png in your Applications root path.


## Contributing

1. Fork it ( https://github.com/mcb/sequel_erd/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
