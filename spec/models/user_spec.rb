# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(
      name: 'Example User',
      email: 'user@example.com',
      password: 'foobar',
      password_confirmation: 'foobar'
    )
  end

  let(:michael) { create(:michael) }
  let(:archer) { create(:archer) }

  it 'user shoulw be valid' do
    expect(user.valid?).to eq true
  end

  context 'user\'s name validation' do
    it 'name should be present' do
      user.name = '  '
      expect(user.valid?).to eq false
    end

    it 'name\' length should be less than 50 chars' do
      user.name = 'a' * 51
      expect(user.valid?).to eq false
    end
  end

  context 'user\s email validation' do
    it 'email should be present' do
      user.email = '  '
      expect(user.valid?).to eq false
    end

    it 'email\' length should be less than 255 chars' do
      user.email = 'a' * 244 + '@example.com' # 256 chars
      expect(user.valid?).to eq false
    end

    it 'email validation should accept valid addresses' do
      5.times do
        user.email = Faker::Internet.email
        expect(user.valid?).to eq true
      end
    end

    it 'email validation should reject invalid addresses' do
      %w(user@example,com user_at_foo.org user.name@example.
         foo@bar_baz.com foo@bar+baz.com).each do |invalid_address|
        user.email = invalid_address
        expect(user.valid?).to eq false
      end
    end

    it 'email address should be unique' do
      duplicate_user = user.dup
      duplicate_user.email.upcase!
      user.save
      expect(duplicate_user.valid?).to eq false
    end

    it 'email address should be saved as lower-case' do
      mixed_case_email = 'Foo@ExAmPle.CoM'
      user.email = mixed_case_email
      user.save
      expect(mixed_case_email.downcase).to eq user.reload.email
    end
  end

  context 'user\'s password validation' do
    it 'password should be present (nonblank)' do
      user.password = user.password_confirmation = ' ' * 6
      expect(user.valid?).to eq false
    end

    it 'password should have a minimum length (6 chars)' do
      user.password = user.password_confirmation = 'a' * 5
      expect(user.valid?).to eq false
    end

    it 'authenticated? should return false for a user with nil digest' do
      expect(user.authenticated?('', attribute: :remember)).to eq false
    end
  end

  context 'follow, unfollow' do
    it 'should follow and unfollow a user' do
      expect(michael.following?(archer)).to eq(false)
      michael.follow(archer)
      expect(michael.following?(archer)).to eq(true)
      expect(michael.following.include?(archer)).to eq(true)
      expect(archer.followers.include?(michael)).to eq(true)
      michael.unfollow(archer)
      expect(michael.following?(archer)).to eq(false)
    end
  end
end
