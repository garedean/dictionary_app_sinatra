require('rspec')
require('word')

describe('Word') do
  describe('#save') do
    it('adds the word to an array containing all words in the dictionary') do
      word = Word.new({:word => "logical"})
      word.save()
      expect(Word.all()).to(eq([word]))
    end

    it('does not add word if #save is not called on word object') do
      word = Word.new({:word => "logical"})
      expect(Word.all()).to(eq([]))
    end
  end
end
