# DebugExtras [![Gem](https://img.shields.io/gem/v/debug-extras.svg)](https://rubygems.org/gems/debug-extras) [![Build Status](https://img.shields.io/travis/vavgustov/debug-extras/master.svg)](https://travis-ci.org/vavgustov/debug-extras) [![Code Climate](https://img.shields.io/codeclimate/github/vavgustov/debug-extras.svg)](https://codeclimate.com/github/vavgustov/debug-extras)

Extras for rails debugging.

At this moment provide next things:
1. `dd <variable>` at any place of your application 
(controllers/models/views/services/etc). After that you can see dump of this 
variable without any other stuff at your web browser. 
It's something like simple alternative to `dd` function from 
[Laravel](https://laravel.com/) for [Ruby on Rails](http://rubyonrails.org/).

2. `rap <variable>` at your views. It's shortcut for `raw ap(<variable>)` and 
alternative to `debug` method from `ActionView::Helpers::DebugHelper`.

## Installation

Add this line to your Gemfile:

```ruby
gem 'debug-extras', group: :development
```

And then execute:

    $ bundle

Or you can install it using [rgversion](https://github.com/vavgustov/rgversion) like any other gems.

## Samples

```ruby
dd self.instance_variables
```

![image](https://user-images.githubusercontent.com/312873/28998770-ddfc7b74-7a3b-11e7-905b-52b3c1c797a4.png)

```erb
<%= rap self.instance_variables %>
```

![image](https://user-images.githubusercontent.com/312873/28998927-9111f88a-7a3f-11e7-9c8d-cb825472d8ca.png)