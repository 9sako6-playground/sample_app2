# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaticPagesController, type: :request do
  let(:base_title) { 'Ruby on Rails Tutorial Sample App' }

  it 'should get root' do
    get root_url
    expect(response).to have_http_status 200
  end

  it 'should get home' do
    get static_pages_home_url
    expect(response).to have_http_status 200 # TODO: responseはどこからやってきた?
    assert_select 'title', "Home | #{base_title}"
  end

  it 'should get help' do
    get static_pages_help_url
    expect(response).to have_http_status 200
    assert_select 'title', 'Help | Ruby on Rails Tutorial Sample App'
  end

  it 'should get about' do
    get static_pages_about_url
    expect(response).to have_http_status 200
    assert_select 'title', 'About | Ruby on Rails Tutorial Sample App'
  end

  it 'should get contact' do
    get static_pages_contact_url
    expect(response).to have_http_status 200
    assert_select 'title', 'Contact | Ruby on Rails Tutorial Sample App'
  end
end
