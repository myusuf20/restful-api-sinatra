# Sinatra

[Sinatra](https://github.com/sinatra/sinatra) is a Domain Specific Language implemented in Ruby that's used for writing web applications. Unlike [Ruby on Rails](https://rubyonrails.org/), which is a Full Stack Web Development Framework that provides everything needed from front to back, Sinatra is designed to be lightweight and flexible. Sinatra is designed to provide you with the bare minimum requirements and abstractions for building simple and dynamic Ruby web applications.

## Installation

Any application that requires the sinatra library will get access to methods like: get and post. These methods provide the ability to instantly transform a Ruby application into an application that can respond to HTTP requests. Here's how to install Sinatra with gems in your terminal.

```gem
gem install sinatra
```
Or written in your Gemfile
```ruby
gem "sinatra"
```
For gemfile do **bundle install**.

## Configuration

First, do the configuration by creating a **config.rb** file and write the command line as follows

```ruby
configure do
  set :port, 8080
  set :bind, '0.0.0.0'
end
```

The purpose is to be able to run **localhost:8080** in your browser.