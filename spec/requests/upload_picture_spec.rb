# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PictureUploader, type: :request do
  let(:michael) { create(:michael) }

  it 'should upload a picture' do
    get login_path
    expect(response).to have_http_status(200)
    post login_path, params: {
      session: {
        email: michael.email,
        password: 'password'
      }
    }
    content = 'This micropost really ties the room together'
    picture = fixture_file_upload('spec/fixtures/icon.jpg', 'image/jpeg')
    post microposts_path, params: {
      micropost: {
        content: content,
        picture: picture
      }
    }
    expect(michael.microposts.first.picture?).to eq(true)
  end
end
