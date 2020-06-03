# frozen_string_literal: true

require 'rails_helper'

RSpec.feature Relationship, type: :feature do
  given(:michael) { create(:michael) }
  given(:archer) { create(:archer) }

  scenario 'should redirect following when not logged in' do
    visit following_user_path(michael)
    expect(current_url).to eq(login_url)
  end

  scenario 'should follow and unfollow' do
    visit login_path
    fill_in 'session_email',	with: michael.email
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    visit user_path(archer)
    before_followers = archer.followers.count
    expect do
      click_button('Follow')
    end.to(change { archer.followers.count }.from(before_followers).to(before_followers + 1))
    expect(page).to have_text("#{before_followers + 1} followers")
    expect do
      click_button('Unfollow')
    end.to(change { archer.followers.count }.from(before_followers + 1).to(before_followers))
    expect(page).to have_text("#{before_followers} followers")
  end
end
