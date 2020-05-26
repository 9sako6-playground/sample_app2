# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersAdminTest', type: :request do
  include SessionsHelper
  let!(:michael) { create(:michael) }
  let!(:archer) { create(:archer) }

  it 'should not allow the admin attribute to be edited via the web' do
    # login
    get login_path
    post login_path, params: {
      session: {
        email: archer.email,
        password: 'password'
      }
    }
    expect(archer.admin?).to eq(false)
    patch user_path(archer), params: {
      user: {
        password: '',
        password_confirmation: '',
        admin: true
      }
    }
    expect(archer.admin?).to eq(false)
  end

  it 'should redirect destroy when not logged in' do
    expect do
      delete user_path(archer)
    end.not_to(change { User.count })
  end

  it 'should redirect destroy when logged in as a non-admin' do
    # login
    get login_path
    post login_path, params: {
      session: {
        email: archer.email,
        password: 'password'
      }
    }
    expect do
      delete user_path(archer)
    end.not_to(change { User.count })
    expect(response.location).to eq(root_url)
  end
end
