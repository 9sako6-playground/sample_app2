# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'edit user\'s infromation', type: :feature do
  given(:michael) { create(:michael) }
  given(:archer) { create(:archer) }

  scenario 'should fail to edit user with invalid name, email, password, password_confirmation' do
    visit login_path
    fill_in 'session_email',	with: michael.email
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    visit edit_user_path(michael)
    fill_in 'user_name', with: ''
    fill_in 'user_email',	with: ''
    fill_in 'user_password',	with: 'bar'
    fill_in 'user_password_confirmation',	with: 'foo'
    click_button('Save change')
    expect(page).to have_text('The form contains 5 errors')
  end

  scenario 'should success to edit user\'s information' do
    visit login_path
    fill_in 'session_email',	with: michael.email
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    visit edit_user_path(michael)
    updated_name = SecureRandom.urlsafe_base64
    updated_email = "#{SecureRandom.urlsafe_base64}@example.com".downcase
    fill_in 'user_name', with: updated_name
    fill_in 'user_email',	with: updated_email
    fill_in 'user_password',	with: ''
    fill_in 'user_password_confirmation',	with: ''
    click_button('Save change')
    michael.reload
    expect(michael.name).to eq(updated_name)
    expect(michael.email).to eq(updated_email)
    expect(page).to have_text(updated_name)
  end

  scenario 'should fail to edit user without login' do
    visit edit_user_path(michael)
    expect(page).not_to have_text('Save change')
  end

  scenario 'should fail to edit other user' do
    visit login_path
    fill_in 'session_email',	with: michael.email
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    visit edit_user_path(archer)
    expect(page).not_to have_text('Update your profile')
  end

  scenario 'friendly forwarding' do
    visit edit_user_path(michael)
    fill_in 'session_email',	with: michael.email
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    expect(current_url).to eq(edit_user_url(michael))
  end
end
