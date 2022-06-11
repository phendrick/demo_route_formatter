# DemoRouteFormatter

Adds a custom route formatter to Rails which renders the routes with emoji's (that don't make sense - just a demo)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'demo_route_formatter', git: "git@github.com:phendrick/demo_route_formatter.git"
```

And then execute:

    $ bundle


## Usage

`rails routes --formatter emoji`
![Emoji route formatter example](https://github.com/phendrick/demo_route_formatter/blob/main/routes.png)

or 

`rails routes --formatter funky`
![Emoji route formatter example](https://github.com/phendrick/demo_route_formatter/blob/main/funky.png)
