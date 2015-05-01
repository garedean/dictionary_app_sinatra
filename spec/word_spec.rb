require('rspec')
require('word')
require('definition')

describe('Word') do
  before do
    Word.clear()
  end

  describe('#save') do
    it('does not add word to dictionary if #save is not called on word') do
      word = Word.new({:word => 'logical'})
      expect(Word.all()).to(eq([]))
    end

    it('adds word to dictionary when called on word') do
      word = Word.new({:word => 'logical'})
      word.save()
      expect(Word.all()).to(eq([word]))
    end
  end

  describe('.clear') do
    it('clears all words from the dictionary') do
      word1 = Word.new({:word => 'cat'})
      word1.save()
      word2 = Word.new({:word => 'kitty'})
      word2.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.all') do
    it('returns an empty array when no words are in dictionary') do
      expect(Word.all()).to(eq([]))
    end

    it('returns array of words when multiple words have been saved') do
      word1 = Word.new({:word => 'logical'})
      word1.save()
      word2 = Word.new({:word => 'programming'})
      word2.save()
      expect(Word.all()).to(eq([word1, word2]))
    end
  end

  describe('#definitions') do
    it('returns empty array when no definitions have been added to a word') do
      word = Word.new({:word => 'logical'})
      expect(word.definitions()).to(eq([]))
    end

    it('returns array of definitions when definitions have been assigned to word') do
      word = Word.new({:word => 'epic'})
      definition1 = word.add_definition('Heroic; majestic; impressively great.')
      definition2 = word.add_definition('Of unusually great size or extent.')
      expect(word.definitions()).to(eq([definition1, definition2]))
    end
  end

  describe('#add_definition') do
    it('adds a definition to the word') do
      word = Word.new({:word => 'logical'})
      definition = word.add_definition('According to or ageeing with the principles of logic.')
      expect(word.definitions()).to(eq([definition]))
    end
  end

  describe('#id') do
    it('returns the id of a word') do
      word = Word.new({:word => 'epic'})
      word.save()
      expect(word.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns a word based on the id argument passed in') do
      word1 = Word.new({:word => 'epic'})
      word1.save()
      word2 = Word.new({:word => 'tubular'})
      word2.save()
      expect(Word.find(1)).to(eq(word1))
    end
  end
end
