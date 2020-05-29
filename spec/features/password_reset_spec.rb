# frozen_string_literal: true

require 'rails_helper'

RSpec.feature PasswordResetsController, type: :feature do
  given(:michael) { create(:michael) }

  background do
    clear_emails
    visit new_password_reset_path
    fill_in 'password_reset_email',	with: michael.email
    click_button('Send')
    open_email(michael.email)
  end

  scenario 'should reset password' do
    current_email.click_link('Reset password')
    expect(page).to have_text('Reset password')
    new_password = SecureRandom.urlsafe_base64
    fill_in 'user_password',	with: new_password
    fill_in 'user_password_confirmation',	with: new_password
    click_button('Send')
    expect(page).to have_text('Password has been reset.')
  end

  scenario '2時間より前に発行されたトークンでのリセットを受け付けない' do
    current_email.click_link('Reset password')
    expect(page).to have_text('Reset password')
    michael.update_attribute(:reset_sent_at, 3.hours.ago)
    new_password = SecureRandom.urlsafe_base64
    fill_in 'user_password',	with: new_password
    fill_in 'user_password_confirmation',	with: new_password
    click_button('Send')
    expect(page).to have_text('Password reset has expired.')
  end
end
