# frozen_string_literal: true

require 'rails_helper'

RSpec.feature Relationship, type: :feature do
  given(:michael) { create(:michael) }
  given(:archer) { create(:archer) }

  scenario 'should redirect following when not logged in' do
    visit following_user_path(michael)
    # expect(current_url).to eq(login_url)
  end
end
