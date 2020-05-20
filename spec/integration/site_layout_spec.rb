# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SiteLayout', type: :request do
  it 'layout links' do
    get root_path
    assert_select 'a[href=?]', root_url, count: 2
    assert_select 'a[href=?]', help_url
    assert_select 'a[href=?]', about_url
    assert_select 'a[href=?]', contact_url
  end
end
