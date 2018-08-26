# frozen_string_literal: true

feature 'viewing blocks' do
  scenario 'see all the blocks stored on the blockchain' do
    visit('/')
    expect(page).to have_content('Latest Blocks')
    expect(page).to have_content('0000')
  end
end
