# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'admin', type: :feature do
  given(:michael) { create(:michael) }
  given(:feature) { create(:feature) }

  it 'adminカラムがtrueのユーザーなら/adminにアクセスできる' do
    visit login_path
    fill_in 'session_email',	with: michael.email
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    visit rails_admin_path
    expect(page.status_code).to eq(200)
  end

  it 'adminカラムがnilのユーザーは/adminにアクセスできない' do
    visit login_path
    fill_in 'session_email',	with: michael.email
    fill_in 'session_password',	with: 'password'
    michael.update_attribute(:admin, nil)
    click_button('Log in')
    expect do
      visit rails_admin_path
    end.to raise_error(CanCan::AccessDenied)
  end

  it 'ログインしていないユーザーは/adminにアクセスできない' do
    expect do
      visit rails_admin_path
    end.to raise_error(CanCan::AccessDenied)
  end
end
