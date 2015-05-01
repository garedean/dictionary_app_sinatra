require('sinatra')
require('sinatra/reloader')
require('./lib/word.rb')
require('./lib/definition.rb')
also_reload('lib/**/*.rb')
#set(:show_exceptions, false)

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/words/new') do
  erb(:word_form)
end

post('/words') do
  word = params.fetch('word')
  word_object = Word.new({:word => word})
  word_object.save()

  redirect to('/')
end
