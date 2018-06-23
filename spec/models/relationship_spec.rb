require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  let(:good_attrs) { { follower_id: user1.id, followed_id: user2.id } }
  let(:bad_attrs) { { follower_id: user1.id } }
  let(:autofollow_attrs) { { follower_id: user1.id, followed_id: user1.id } }

  it "should be valid with good attributes" do
    expect(Relationship.new(good_attrs)).to be_valid
  end

  it "should be invalid with bad attributes" do
    expect(Relationship.new(bad_attrs)).to_not be_valid
  end

  it "shouldn't permit autofollow" do
    expect(Relationship.new(autofollow_attrs)).to_not be_valid
  end
end
