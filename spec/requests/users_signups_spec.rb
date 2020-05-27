# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersSignupTest', type: :request do
  include SessionsHelper
  describe 'signup test' do
    before(:each) { ActionMailer::Base.deliveries.clear }
    it 'reject to signup with invalid information' do
      get signup_path
      expect do
        post users_path, params: {
          user: {
            name: '',
            email: 'user@invalid',
            password: 'foo',
            password_confirmation: 'bar'
          }
        }
      end.not_to(change { User.count })
    end

    it 'accept to signup with valid information and account activation' do
      get signup_path
      before_count = User.count
      expect do
        post users_path, params: {
          user: {
            name: 'Example User',
            email: 'user@example.com',
            password: 'password',
            password_confirmation: 'password'
          }
        }
      end.to(change { User.count }.from(before_count).to(before_count + 1))
      expect(ActionMailer::Base.deliveries.size).to eq(1)
      user = assigns(:user)
      expect(user.activated?).to eq(false)
      # 有効化していない状態でログイン
      get login_path
      post login_path, params: {
        session: {
          email: user.email,
          password: 'password'
        }
      }
      expect(loggedin?).to eq(false)
      # 有効化トークンが不正な場合
      get edit_account_activation_path('invalid token', email: user.email)
      expect(loggedin?).to eq(false)
      # メールアドレスが無効な場合
      get edit_account_activation_path(user.activation_token, email: 'wrong')
      expect(loggedin?).to eq(false)
      # 有効なトークンとメールアドレスの場合
      get edit_account_activation_path(user.activation_token, email: user.email)
      expect(user.reload.activated?).to eq(true)
      expect(loggedin?).to eq(true)
    end
  end
end
