require('capybara/rspec')
require('./app')
require('pry')
Capybara.app = Sinatra::Application

describe('the online dictionary app', :type => :feature) do
  before do
    Word.clear()
    visit('/')
  end

  describe('words/:id/definitions path') do
    it('adds a new definition to a word for a form POST') do
      click_link('Add one.')
      fill_in('word', :with => 'kitten')
      click_button('Add Word')
      click_link('Kitten')
      click_link('Add one.')
      fill_in('definition', :with => 'a young cat.')
      click_button('Add Definition')
      expect(page).to(have_content("Definition #1: a young cat."))
    end
  end
end
