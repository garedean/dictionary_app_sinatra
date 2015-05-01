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
  @word = Word.find(params.fetch('id').to_i())

  erb(:word)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i)

  erb(:definition_form)
end

post('/definitions') do
  word = Word.find(params.fetch('id').to_i)
  word.add_definition(params.fetch('definition'))

  redirect to("/words/#{word.id}")
end
