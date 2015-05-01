class Word
  @@words = []
  attr_reader(:word, :definitions, :id)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word).capitalize()
    @definitions = []
    @id = @@words.size() + 1
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_method(:add_definition) do |definition|
    definition = Definition.new({:definition => definition})
    @definitions.push(definition)
    definition
  end

  define_method(:find_word) do |target_id|
    word_match = nil
    @@words.each do |word|
      if word.id == target_id
        word_match = word
      end
    end
    word_match
  end
end
