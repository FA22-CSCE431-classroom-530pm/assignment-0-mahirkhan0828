# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'title' do
      visit new_book_path
      fill_in 'Title', with: 'Harry Potter'
      fill_in 'Author', with: 'J.K. Rowling'
      fill_in 'Price', with: '10'
      select 'August', from: 'book_published_date_2i' 
      select '2019', from: 'book_published_date_1i' 
      select '28', from: 'book_published_date_3i' 
      click_on 'Create Book'
      visit books_path
      expect(page).to have_content('Harry Potter')
  end

  scenario 'title' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '10'
    select 'August', from: 'book_published_date_2i' 
    select '2019', from: 'book_published_date_1i' 
    select '28', from: 'book_published_date_3i' 
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('J.K. Rowling')
  end

  scenario 'title' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '10'
    select 'August', from: 'book_published_date_2i' 
    select '2019', from: 'book_published_date_1i' 
    select '28', from: 'book_published_date_3i' 
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('10')
  end

  scenario 'title' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '10'
    select 'August', from: 'book_published_date_2i' 
    select '2019', from: 'book_published_date_1i' 
    select '28', from: 'book_published_date_3i' 
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('2019-08-28')
  end
end