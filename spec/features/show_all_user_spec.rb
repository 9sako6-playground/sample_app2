# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'index', type: :feature do
  given(:michael) { create(:michael) }

  scenario 'should redirect index when not logged in' do
    visit users_path
    expect(current_url).to eq(login_url)
  end
end
