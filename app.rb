require('sinatra')
require('sinatra/reloader')
require('./lib/word.rb')
require('./lib/definition.rb')
also_reload('lib/**/*.rb')
#set(:show_exceptions, false)

get('/reset') do
  Word.clear()
  redirect to('/')
end

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

get('/words/:id') do
  id = params.fetch('id').to_i
  @word = Word.find(id)
  @word_definitions = @word.definitions()

  erb(:word)
end
