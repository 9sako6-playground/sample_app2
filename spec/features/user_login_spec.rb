# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'login', type: :feature do
  given(:michael) { create(:michael) }

  scenario 'log in with correct credentials' do
    visit login_path
    fill_in 'session_email',	with: michael.email
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    expect(page).to have_text(michael.name)
  end

  scenario 'log in with incorrect credentials' do
    visit login_path
    fill_in 'session_email',	with: "#{michael.email}.not"
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    expect(page).to_not have_text(michael.name)
  end
end
