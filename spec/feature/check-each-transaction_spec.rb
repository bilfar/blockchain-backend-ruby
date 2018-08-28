# frozen_string_literal: true

require_relative '../../app.rb'

feature 'viewing transactions' do
  scenario 'see each unverified transactions stored on the blockchain' do
    visit('/')
    click_button('hash_button')
    expect(page).to have_content('Block Hash')
  end
end
