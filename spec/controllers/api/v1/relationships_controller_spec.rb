require 'rails_helper'

RSpec.describe Api::V1::RelationshipsController, type: :controller do

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  describe 'POST create' do
    it "requires the user to be logged in" do
      post :create, params: { followed_id: user2.id }, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "creates a new relationship with good params" do
      login(user1)
      post :create, params: { followed_id: user2.id }, format: :json
      expect(response).to have_http_status(:ok)
    end

    it "returns errors with bad params" do
      login(user1)
      post :create
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json_response[:followed_id]).to eq(["can't be blank"])
    end
  end
end
