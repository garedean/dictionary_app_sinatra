require('capybara/rspec')
require('./app')
require('pry')
Capybara.app = Sinatra::Application
