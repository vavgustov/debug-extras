# DebugExtras 
[![Gem](https://img.shields.io/gem/v/debug-extras.svg)](https://rubygems.org/gems/debug-extras) [![Build Status](https://img.shields.io/travis/vavgustov/debug-extras/master.svg)](https://travis-ci.org/vavgustov/debug-extras) [![Maintainability](https://api.codeclimate.com/v1/badges/63067512ae858df2a5b3/maintainability)](https://codeclimate.com/github/vavgustov/debug-extras/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/63067512ae858df2a5b3/test_coverage)](https://codeclimate.com/github/vavgustov/debug-extras/test_coverage)

Extras for Ruby on Rails debugging. [Screenshots](https://github.com/vavgustov/debug-extras#screenshots).

## Features

> Note: some of them not released as gem yet.

At this moment provide next things:
* `dd <variable>` at any `app/` place. After that you can see dump of this 
variable without any other stuff at your web browser. 
It's something like simple alternative to `dd` function from 
[Laravel](https://laravel.com/) for [Ruby on Rails](http://rubyonrails.org/).

* `wp <variable>` at any `app/` place. It's alternative to classic PHP print debugging. 
Works for HTML pages.

* `dump <variable>` at your views. It's alternative for `debug` method from 
`ActionView::Helpers::DebugHelper` and `ap` from `AwesomePrint`.

## Installation

Add this line to your Gemfile:

```ruby
gem 'debug-extras', group: :development
```

And then execute:

    $ bundle

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

## License

DebugExtras is released under the [MIT License](https://opensource.org/licenses/MIT).
