require 'rails_helper'

RSpec.describe Api::V1::BlocksController, type: :controller do

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  describe 'POST create' do
    it "requires the user to be logged in" do
      post :create, params: { blocked_id: user2.id }, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "creates a new block with good params" do
      login(user1)
      post :create, params: { blocked_id: user2.id }, format: :json
      expect(response).to have_http_status(:ok)
    end

    it "returns errors with bad params" do
      login(user1)
      post :create
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json_response[:blocked_id]).to eq(["can't be blank"])
    end
  end

  describe 'DELETE destroy' do
    it "requires the user to be logged in" do
      delete :destroy, params: { id: user2.id }, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "destroys a block with good params" do
      login(user1)
      user1.block(user2.id)
      delete :destroy, params: { id: user2.id }, format: :json
      expect(response).to have_http_status(:ok)
    end

    it "returns errors with bad params" do
      login(user1)
      user1.block(user2.id)
      delete :destroy, params: { id: 222939 }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end

end
