require 'rails_helper'

RSpec.describe Block, type: :model do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  let(:good_attrs) { { blocker_id: user1.id, blocked_id: user2.id } }
  let(:bad_attrs) { { blocker_id: user1.id } }
  let(:autoblock_attrs) { { blocker_id: user1.id, blocked_id: user1.id } }

  it "should be valid with good attributes" do
    expect(Block.new(good_attrs)).to be_valid
  end

  it "should be invalid with bad attributes" do
    expect(Block.new(bad_attrs)).to_not be_valid
  end

  it "shouldn't permit autoblock" do
    expect(Block.new(autoblock_attrs)).to_not be_valid
  end
end
