# InpostApi

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'inpost_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install inpost_api

## Usage

First, you must set up config (for example in config/initializers/inpost.rb) and add following code:

```ruby
InpostApi.configure do |config|
  config.endpoint = 'https://api-pl.easypack24.net/v4/machines'
end
```

Next, you should use available methods:

##### 1) Get Inpost Lockers

```ruby
InpostApi.get_inpost_lockers => Array

InpostApi.get_inpost_lockers(type: 1) => Array
```
>- optional options:
:type,

##### 2) Get Inpost Locker

```ruby
InpostApi.get_inpost_locker('ALL992')

InpostApi.get_inpost_locker('correct_id') => Hash

InpostApi.get_inpost_locker('incorrect_id') => nil
```
>- require options:
:id

##### 3) Helper
```ruby
<%= inpost_lockers_tag(1) %>

```
>- require options:
:type
