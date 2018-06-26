require 'rails_helper'

RSpec.describe CollectionNote, type: :model do
  let(:user) { create(:user) }

  let(:good_attrs) {
    { user_id: user.id, notes_attributes: [
                       { body: "lorem ipsum", shared: true },
                       { body: "lorem ipsum", shared: true } ]
    }
  }

  let(:bad_attrs) {
    { user_id: user.id, notes_attributes: [
                       { body: nil, shared: true },
                       { body: "lorem ipsum", shared: true } ]
    }
  }


  it "should be valid with good attributes" do
    expect(CollectionNote.new(good_attrs)).to be_valid
  end

  it "should be invalid with bad attributes" do
    expect(CollectionNote.new(bad_attrs)).to_not be_valid
  end

end
