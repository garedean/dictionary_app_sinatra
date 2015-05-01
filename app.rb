require('sinatra')
require('sinatra/reloader')
require('./lib/word.rb')
require('./lib/definition.rb')
also_reload('lib/**/*.rb')
set(:show_exceptions, false)

get('/') do
  erb(:index)
end
