# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'delete', type: :feature do
  given(:michael) { create(:michael) }
  given(:archer) { create(:archer) }

  it 'should delete a micropost by a valid user' do
    visit login_path
    fill_in 'session_email',	with: michael.email
    fill_in 'session_password',	with: 'password'
    click_button('Log in')
    visit root_path
    micropost_content = 'test post'
    fill_in 'micropost_content', with: micropost_content
    click_button('Post')
    expect(page).to have_text(micropost_content)
    before_count = Micropost.count
    expect do
      click_link('delete')
    end.to(change { Micropost.count }.from(before_count).to(before_count - 1))
    # 違うユーザーのプロフィールにアクセス (削除リンクがないことを確認)
    archer.microposts.create(content: micropost_content)
    visit user_path(archer)
    expect(page).not_to have_text('delete')
  end
end
