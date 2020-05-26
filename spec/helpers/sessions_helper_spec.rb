# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsHelper do
  let(:user) do
    User.new(
      name: 'Example User',
      email: 'user@example.com',
      password: 'foobar',
      password_confirmation: 'foobar'
    )
  end

  it 'current_user returns right user when session is nil' do
    remember(user)
    expect(current_user).to eq(user)
    expect(loggedin?).to eq(true)
  end

  it 'current_user returns nil when remember digest is wrong' do
    user.update_attribute(:remember_digest, User.digest(User.new_token))
    expect(current_user).to eq(nil)
  end
end
