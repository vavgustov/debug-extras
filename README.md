# DebugExtras [![Gem](https://img.shields.io/gem/v/debug-extras.svg)](https://rubygems.org/gems/debug-extras) [![Build Status](https://img.shields.io/travis/vavgustov/debug-extras/master.svg)](https://travis-ci.org/vavgustov/debug-extras)

Extras for Ruby on Rails debugging. [Screenshots](https://github.com/vavgustov/debug-extras#screenshots).

## Features

At this moment provide next things:
1. `dd <variable>` at any place of your application 
(controllers/models/views/services/etc). After that you can see dump of this 
variable without any other stuff at your web browser. 
It's something like simple alternative to `dd` function from 
[Laravel](https://laravel.com/) for [Ruby on Rails](http://rubyonrails.org/).

2. `dump <variable>` at your views. It's alternative for `debug` method from `ActionView::Helpers::DebugHelper`.

3. temporary fix for `better_errors` and `binding_or_caller` with `puma 3.x` performance [issue](https://github.com/charliesome/better_errors/issues/341).

## Installation

Add this line to your Gemfile:

```ruby
gem 'debug-extras', group: :development
```

And then execute:

    $ bundle

Or you can install it using [rgversion](https://github.com/vavgustov/rgversion) like any other gems.

## Screenshots

`dd` from controller/model/service/etc:

```ruby
dd Book.all
```

![image](https://user-images.githubusercontent.com/312873/29333319-0480bb34-820c-11e7-82b0-3d2e648a4af8.png)

`dump` from views:

```erb
<%= dump Book.all %>
```

![image](https://user-images.githubusercontent.com/312873/29333320-0482b484-820c-11e7-87ce-800e5319ce98.png)
