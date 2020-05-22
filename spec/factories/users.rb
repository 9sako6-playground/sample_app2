# frozen_string_literal: true

user_password = 'password'

FactoryBot.define do
  factory :user do
    name { 'Michael Example' }
    email { 'michael@example.com' }
    password { user_password }
    password_digest { User.digest(user_password) }
  end
end
