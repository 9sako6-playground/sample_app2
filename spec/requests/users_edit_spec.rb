# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersEditTest', type: :request do
  include SessionsHelper
  let(:michael) { create(:michael) }

  describe 'edit' do
    it 'login with remembering' do
      post login_path, params: {
        session: {
          email: michael.email,
          password: 'password',
          remember_me: '1'
        }
      }
      expect(cookies['remember_token']).to eq(assigns(:user).remember_token)
    end

    it 'login without remembering' do
      post login_path, params: {
        session: {
          email: michael.email,
          password: 'password',
          remember_me: '0'
        }
      }
      expect(cookies['remember_token']).to be_nil
    end
  end
end
