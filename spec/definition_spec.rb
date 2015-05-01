require('rspec')
require('definition')

describe('Definition') do
  describe('#definition') do
    it('returns the content of a definition') do
      word5 = Word.new({:word => 'puppy'})
      word5.save()
      word5.add_definition("A young canine.")
      expect(word5.definitions().first().definition()).to(eq("A young canine."))
    end
  end
end
