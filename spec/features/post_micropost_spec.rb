# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'delete', type: :feature do
  given(:michael) { create(:michael) }

  it 'should post a micropost by a valid user' do
    visit login_path
    fill_in 'session_email',	with: michael.email
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    visit root_path
    # 有効な投稿
    micropost_content = 'test post'
    fill_in 'micropost_content', with: micropost_content
    click_button('Post')
    expect(page).to have_text(micropost_content)
    # 無効な投稿
    fill_in 'micropost_content', with: ''
    click_button('Post')
    expect(page).to have_text('The form contains 1 error')
  end
end
