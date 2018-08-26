# frozen_string_literal: true

feature 'miner page' do
  scenario 'see a basic miner page' do
    visit('/')
    expect(page).to have_content('Hello world!')
  end
end
