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
