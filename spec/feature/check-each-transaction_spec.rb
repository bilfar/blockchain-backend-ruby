# frozen_string_literal: true

require_relative '../../app.rb'

feature 'viewing transactions' do
  scenario 'see each unverified transactions stored on the blockchain' do
    visit('/')
    click_link('hash_link')
    expect(page).to have_content('Block Hash')
  end
end
