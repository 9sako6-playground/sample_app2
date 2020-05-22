# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersSignupTest', type: :request do
  describe 'signup test' do
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

    it 'accept to signup with valid information' do
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
    end
  end
end
