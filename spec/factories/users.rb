# frozen_string_literal: true

user_password = 'password'

FactoryBot.define do
  factory :michael, class: User do
    name { 'Michael Example' }
    email { 'michael@example.com' }
    password { user_password }
    password_digest { User.digest(user_password) }
  end
  factory :archer, class: User do
    name { 'Sterling Archer' }
    email { 'duchess@example.gov' }
    password { user_password }
    password_digest { User.digest(user_password) }
  end
end
