require('rspec')
require('word')

describe('Word') do
  before do
    Word.clear()
  end

  describe('#save') do
    it('adds word to dictionary when called on word') do
      word = Word.new({:word => 'logical'})
      word.save()
      expect(Word.all()).to(eq([word]))
    end

    it('does not add word to dictionary if #save is not called on word') do
      word = Word.new({:word => 'logical'})
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
end
