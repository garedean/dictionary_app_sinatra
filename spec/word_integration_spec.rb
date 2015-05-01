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
    it('displays message when no words exist') do
      expect(page).to(have_content("There aren't any words in the dictionary. Add one."))
    end

    it('displays dictionary words when words exist') do
      click_link('Add one.')
      fill_in('word', :with => 'epic')
      click_button('Add Word')
      expect(page).to(have_content("Epic"))
    end
  end

  describe('/words path') do
    it('adds a word to the dictionary when a form is posted to it') do
      click_link('Add one.')
      fill_in('word', :with => 'epic')
      click_button('Add Word')
    end
  end

  describe('/words/:id path') do
    it('displays a message if no definitions exist for the word') do
      click_link('Add one.')
      fill_in('word', :with => 'epic')
      click_button('Add Word')
      click_link('Epic')
      expect(page).to(have_content("There aren't any definitions for this word."))
    end

    it('displays definitions for a word when definitions exist') do
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
