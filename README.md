# DebugExtras 
[![Gem](https://img.shields.io/gem/v/debug-extras.svg)](https://rubygems.org/gems/debug-extras) [![Build Status](https://img.shields.io/travis/vavgustov/debug-extras/master.svg)](https://travis-ci.org/vavgustov/debug-extras) [![Maintainability](https://api.codeclimate.com/v1/badges/63067512ae858df2a5b3/maintainability)](https://codeclimate.com/github/vavgustov/debug-extras/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/63067512ae858df2a5b3/test_coverage)](https://codeclimate.com/github/vavgustov/debug-extras/test_coverage)

Extras for Ruby on Rails debugging. [Screenshots](https://github.com/vavgustov/debug-extras#usage).

> Note: README actual for master branch.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
    - [#dd](#dd)
    - [#wp](#wp)
    - [#dump](#dump)
- [Styling](#styling)    
- [License](#license)

## Features
* `dd <variable>` at any `app/` place. Inspired by `dd` function from 
[Laravel](https://laravel.com/).

* `wp <variable>` at any `app/` place. Inspired by classic PHP 'print' debugging. 
It works for HTML pages and bypass other content types like `application/json`.

* `dump <variable>` at your views. It's alternative for `debug` method from 
`ActionView::Helpers::DebugHelper` and `ap` from `AwesomePrint`.

## Installation

Add this line to your Gemfile:

```ruby
gem 'debug-extras', group: :development
```

And then execute:

    $ bundle

## Usage

### #dd

Call `dd` from any `app/` place:

```ruby
dd @books
```

![image](https://user-images.githubusercontent.com/312873/35333798-26e3f95e-0121-11e8-86e1-4e0d5bd1b068.png)

### #wp

Call `wp` from any `app/` place:

```ruby
wp 'Authors through #wp method (called from controller):'
wp @authors
```

![image](https://user-images.githubusercontent.com/312873/35333801-271a9c0c-0121-11e8-91d5-740706150c32.png)

### #dump

Call `dump` from views:

```erb
<%= dump 'Books through #dump method (called from view):' %>
<%= dump @books %>
```

![image](https://user-images.githubusercontent.com/312873/35333799-26ffefba-0121-11e8-8021-a5faa62e6953.png)

## Styling
DebugExtras inject CSS to the page on methods call. You can override styles and set your fonts, 
margins, etc using `.debug-extras` wrapper. Just look to page html sources to get an idea.  

## License

DebugExtras is released under the [MIT License](https://opensource.org/licenses/MIT).
