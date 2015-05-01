require('rspec')
require('word')

describe('Word') do
  before do
    Word.clear()
  end

  describe('#save') do
    it('adds the word to an array containing all words in the dictionary') do
      word = Word.new({:word => "logical"})
      word.save()
      expect(Word.all()).to(eq([word]))
    end
  end

  it('does not add the word to array containing all words if #save is not called') do
    word = Word.new({:word => "logical"})
    expect(Word.all()).to(eq([]))
  end
end
