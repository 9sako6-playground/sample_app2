# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersLoginTest', type: :request do
  include SessionsHelper
  let(:user) { create(:user) }

  describe 'login' do
    it 'login with invalid information' do
      get login_path
      expect(response).to have_http_status(200)
      post login_path, params: {
        session: {
          email: 'user@invalid',
          password: 'foo'
        }
      }
      expect(flash.empty?).to eq(false)
      get root_path
      expect(flash.empty?).to eq(true)
    end

    it 'login with valid information' do
      get login_path
      post login_path, params: {
        session: {
          email: user.email,
          password: 'password'
        }
      }
      expect(response).to redirect_to(user_path(user))
      expect(loggedin?).to eq(true)
      # logout
      delete logout_path
      expect(loggedin?).to eq(false)
      expect(response).to redirect_to(root_url)
      expect(response.code).to eq '302'
      # 2番目のウィンドウでログアウトするユーザーのシミュレート
      delete logout_path
    end

    it 'login with remembering' do
      post login_path, params: {
        session: {
          email: user.email,
          password: 'password',
          remember_me: '1'
        }
      }
      expect(cookies['remember_token']).to eq(assigns(:user).remember_token)
    end

    it 'login without remembering' do
      post login_path, params: {
        session: {
          email: user.email,
          password: 'password',
          remember_me: '0'
        }
      }
      expect(cookies['remember_token']).to be_nil
    end
  end
end
