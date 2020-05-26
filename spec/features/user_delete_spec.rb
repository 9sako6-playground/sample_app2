# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'delete', type: :feature do
  given!(:michael) { create(:michael) }
  given!(:archer) { create(:archer) }

  scenario 'should redirect index when not logged in' do
    visit login_path
    fill_in 'session_email',	with: michael.email
    fill_in 'session_password',	with: michael.password
    click_button('Log in')
    visit users_path
    before_count = User.count
    expect do
      click_link('delete')
    end.to(change { User.count }.from(before_count).to(before_count - 1))
  end
end
