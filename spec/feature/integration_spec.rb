# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end
end

# Integration test for author
RSpec.describe 'Creating a book with author attribute', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Author', with: 'J.K. Rowling'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('J.K. Rowling')
  end
end

# Integration test for price
RSpec.describe 'Creating a book with price attribute', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Price', with: 10
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content(10)
  end
end

# Integration test for published date
RSpec.describe 'Creating a book with date attribute', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Date', with: 'Sat, 10 Nov 2007'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Sat, 10 Nov 2007')
  end
end