require 'rails_helper'

describe User, type: :model do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  let(:good_attrs) { { name: "John",
                       nickname: "Cena",
                       email: "john@cena.com",
                       password: "asdfasdf" } }

  let(:bad_attrs)  { { name: "John",
                       nickname: "Cena",
                       email: "john@cena.com",
                       password: nil } }

  it "should be valid with good attributes" do
    expect(User.new(good_attrs)).to be_valid
  end

  it "should be invalid with bad attributes" do
    expect(User.new(bad_attrs)).to_not be_valid
  end

  context "#follow" do
    it "should follow other user" do
      expect(user1.follow(user2.id)).to be_valid
    end

    it "shouldn't follow other user a twice" do
      user1.follow(user2.id)
      expect(user1.follow(user2.id)).to_not be_valid
    end
  end

  context "#unfollow" do
    it "should unfollow other followed user" do
      user1.follow(user2.id)

      expect { user1.unfollow(user2.id)}.to change {
        user1.followees.count
      }.from(1).to(0)
    end
  end

  context "#block" do
    it "should block other user" do
      expect(user1.block(user2.id)).to be_valid
    end

    it "shouldn't block other user a twice" do
      user1.block(user2.id)
      expect(user1.block(user2.id)).to_not be_valid
    end
  end

  context "#unblock" do
    it "should unblock other blocked user" do
      user1.block(user2.id)

      expect { user1.unblock(user2.id)}.to change {
        user1.blocked_users.count
      }.from(1).to(0)
    end
  end

  context "notes" do
    it "should list shared followees notes" do
    end
  end
end
