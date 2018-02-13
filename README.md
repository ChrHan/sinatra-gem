# Sinatra With Ruby Gem

A gem for BukaLapak's SRE Onboarding Project.

This project integrates Sinatra framework and gem produced from previous project.

Tables supported for this gem is described below.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'database_wrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install database_wrapper

An `SQLite3` Database needs to be created, named as `database.db` 

## Usage

### DB Setup

    CREATE TABLE PRODUCTS (
      id  INT PRIMARY KEY,
      product_name VARCHAR(20)
    );

### Using Gem

    gem install database_wrapper-0.1.0.gem

    irb
    > require 'database_wrapper'
    > DatabaseWrapper.select

### Starting up Sinatra

    bundle exec ruby app.rb

### Functions available

`localhost:4567/select` -> select * from products
`localhost:4567/insert?id=:id&product_name=:product_name)` -> insert into products values (':id', ':product_name')
`localhost:4567/delete?id=:id` -> delete from products where id = ':id'
`localhost:4567/update?id=:id&product_name=:product_name)` -> update products set product_name = ':product_name' where id = ':id'

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ChrHan/ruby-sinatra-gem.

