# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'login', type: :feature do
  given(:user) { create(:user) }

  scenario 'log in with correct credentials' do
    visit '/login'
    fill_in 'session_email',	with: user.email
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    expect(page).to have_text(user.name)
  end

  scenario 'log in with incorrect credentials' do
    visit '/login'
    fill_in 'session_email',	with: "#{user.email}.not"
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    expect(page).to_not have_text(user.name)
  end
end
