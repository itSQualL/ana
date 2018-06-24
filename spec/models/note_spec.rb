require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:user) { create(:user) }

  let(:good_attrs) { { user_id: user.id, body: "lorem ipsum" } }
  let(:bad_attrs) { { body: "lorem ipsum" } }

  it "should be valid with good attributes" do
    expect(Note.new(good_attrs)).to be_valid
  end

  it "should be invalid with bad attributes" do
    expect(Note.new(bad_attrs)).to_not be_valid
  end
end
