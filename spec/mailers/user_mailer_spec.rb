# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'account_activation' do
    let(:michael) { create(:michael) }

    it 'should send account activation mail' do
      michael.activation_token = User.new_token
      mail = UserMailer.account_activation(michael)
      expect(mail.subject).to eq('Account activation')
      expect(mail.to).to eq([michael.email])
      expect(mail.from).to eq(['noreply@example.com'])
      expect(mail.body.encoded).to match(michael.name)
      expect(mail.body.encoded).to match(michael.activation_token)
      expect(mail.body.encoded).to match(CGI.escape(michael.email))
    end
  end

  # describe 'password_reset' do
  #   let(:mail) { UserMailer.password_reset }

  #   it 'renders the headers' do
  #     expect(mail.subject).to eq('Password reset')
  #     expect(mail.to).to eq(['to@example.org'])
  #     expect(mail.from).to eq(['from@example.com'])
  #   end

  #   it 'renders the body' do
  #     expect(mail.body.encoded).to match('Hi')
  #   end
  # end
end