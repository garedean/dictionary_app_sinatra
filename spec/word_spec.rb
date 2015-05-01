require('rspec')
require('word')

describe('Word') do
  before do
    Word.clear()
  end

  describe('#save') do
    it('adds word to dictionary when called on word') do
      word = Word.new({:word => "logical"})
      word.save()
      expect(Word.all()).to(eq([word]))
    end

    it('does not add word to dictionary if #save is not called on word') do
      word = Word.new({:word => "logical"})
      expect(Word.all()).to(eq([]))
    end
  end
end
