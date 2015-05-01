require('capybara/rspec')
require('./app')
require('pry')
Capybara.app = Sinatra::Application

describe('the online dictionary app', :type => :feature) do
  before do
    Word.clear()
    visit('/')
  end

  describe('/ path') do
    it('loads the home page') do
      expect(page).to(have_content('Online Dictionary'))
    end

    it('displays message when no words exist') do
      expect(page).to(have_content("There aren't any words in the dictionary. Why not add one?"))
    end
  end

  describe('/words POST') do
    it('adds a word to the dictionary') do
      click_link('Add one.')
    end
  end
end
