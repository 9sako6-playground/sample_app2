# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'show', type: :feature do
  given(:michael) { create(:michael) }
  before do
    30.times do |i|
      michael.microposts.create(
        content: "Lorem ipsum #{i}"
      )
    end
  end

  scenario 'page should include pagination' do
    visit login_path
    fill_in 'session_email',	with: michael.email
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    visit user_path(michael)
    expect(page).to have_text(michael.name)
    expect(page).to have_css('.pagination')
  end
end
