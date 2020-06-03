# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:michael) { create(:michael) }
  let(:archer) { create(:archer) }
  before do
    @relationship = Relationship.new(follower_id: michael.id, followed_id: archer.id)
  end

  it 'should be valid' do
    expect(@relationship.valid?).to eq(true)
  end

  it 'should require a follower_id' do
    @relationship.follower_id = nil
    expect(@relationship.valid?).to eq(false)
  end

  it 'should require a followed_id' do
    @relationship.followed_id = nil
    expect(@relationship.valid?).to eq(false)
  end
end
