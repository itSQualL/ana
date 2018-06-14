require 'rails_helper'

describe User, type: :model do
  let(:good_attrs) do
    {
      name: "John",
      nickname: "Cena",
      email: "john@cena.com",
      password: "asdfasdf",
    }
  end

  let(:bad_attrs) do
    {
      name: "John",
      nickname: "Cena",
      email: "john@cena.com",
      password: nil
    }
  end

  it "should be valid with good attributes" do
    expect(User.new(good_attrs)).to be_valid
  end

  it "should be invalid with bad attributes" do
    expect(User.new(bad_attrs)).to_not be_valid
  end
end
