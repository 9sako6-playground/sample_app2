# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'index', type: :feature do
  given(:michael) { create(:michael) }
  30.times do |i|
    given!("user_#{i}".to_sym){ create("user_#{i}".to_sym) }
  end

  scenario 'should redirect index when not logged in' do
    visit users_path
    expect(current_url).to eq(login_url)
  end

  scenario 'page should include pagination' do
    visit login_path
    fill_in 'session_email',	with: michael.email
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    visit users_path
    expect(page).to have_css('.pagination')
  end
end
