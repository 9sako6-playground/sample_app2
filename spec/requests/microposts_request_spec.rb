# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Microposts', type: :request do
  let(:michael) { create(:michael) }
  let(:archer) { create(:archer) }
  before do
    archer.microposts.create(content: 'hoge')
  end
  it 'should redirect destroy for wrong micropost' do
    get login_path
    post login_path, params: {
      session: {
        email: 'user@invalid',
        password: 'foo'
      }
    }
    post = archer.microposts.first
    expect do
      delete micropost_path(post)
    end.not_to(change { Micropost.count })
  end
end
