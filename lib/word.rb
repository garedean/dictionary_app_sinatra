class Word
  @@words = []

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:all) do
    @@words
  end
end
