# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:michael) { create(:michael) }
  let(:post) { michael.microposts.build(content: 'Lorem ipsum') }

  it 'should be valid' do
    expect(post.valid?).to eq(true)
  end

  it 'user id should be present' do
    post.user_id = nil
    expect(post.valid?).to eq(false)
  end

  it 'content should be present' do
    post.content = '   '
    expect(post.valid?).to eq(false)
  end

  it 'content should be at most 140 characters' do
    post.content = 'a' * 141
    expect(post.valid?).to eq(false)
  end

  xit 'order should be most recent first' do
    expect(michael.microposts(:most_recent)).to eq(Micropost.first)
  end

  it 'associated microposts should be destroyed' do
    michael.save
    michael.microposts.create!(content: 'Lorem ipsum')
    before_count = Micropost.count
    expect do
      michael.destroy
    end.to(change { Micropost.count }.from(before_count).to(before_count - 1))
  end
end
