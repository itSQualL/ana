require 'rails_helper'

RSpec.describe Api::V1::RelationshipsController, type: :controller do

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  describe 'POST create' do
    it "requires the user to be logged in" do
      post :create, params: { followed_id: user2.id }, format: :json
      expect(json_response[:errors]).to eq(["You need to sign in or sign up before continuing."])
    end

    it "creates a new relationship with good params" do
      login(user1)
      post :create, params: { followed_id: user2.id }, format: :json
    end

    it "returns errors with bad params" do
      login(user1)
      post :create
      expect(json_response[:followed_id]).to eq(["can't be blank"])
    end
  end
end
