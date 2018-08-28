# frozen_string_literal: true

require_relative '../../app.rb'

feature 'viewing blocks' do
  scenario 'see all the blocks stored on the blockchain' do
    visit('/')
    expect(page).to have_content('Blocks')
    expect(page).to have_content('N/A')
  end
end

feature 'viewing transactions' do
  scenario 'see all the unverified transactions stored on the blockchain' do
    visit('/')
    expect(page).to have_content('Unverified Transactions')
  end
end

feature 'mining blocks' do
  scenario 'has a mine button' do
    visit('/')
    expect(page).to have_button('Mine')
  end
end

feature 'blocks hash' do
  scenario 'has a block hash button' do
    visit('/')
    expect(page).to have_button('hash_button')
  end
end
