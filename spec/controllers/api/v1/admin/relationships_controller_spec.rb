require 'rails_helper'

RSpec.describe Api::V1::Admin::RelationshipsController, type: :controller do
  let(:admin) { create(:admin) }
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  let(:relationship) { create(:relationship) }

  describe 'GET index' do
    it "requires the user to be logged in" do
      get :index, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "requires the user to be admin" do
      login(user1)
      get :index, format: :json
      expect(response).to have_http_status(:forbidden)
    end

    it "list relationships" do
      login(admin)
      relationship
      get :index, format: :json
      expect(json_response.count).to eq(1)
    end
  end

  describe 'POST create' do
    it "requires the user to be logged in" do
      post :create, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "requires the user to be admin" do
      login(user1)
      post :create, format: :json
      expect(response).to have_http_status(:forbidden)
    end

    it "creates a new relationship with good params" do
      login(admin)
      post :create, params: { relationship: {follower_id: user1.id, followed_id: user2.id, allowed: true} }, format: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT update' do
    it "requires the user to be logged in" do
      put :update, params: { id: 3 }, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "requires the user to be admin" do
      login(user1)
      put :update, params: { id: 3 }, format: :json
      expect(response).to have_http_status(:forbidden)
    end

    it "updates the relationship" do
      login(admin)
      put :update, params: { id: relationship.id, relationship: { allowed: true } }, format: :json
      expect(json_response[:allowed]).to eq(true)
    end
  end

  describe 'DELETE destroy' do
    it "requires the user to be logged in" do
      delete :destroy, params: { id: 3 }, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "requires the user to be admin" do
      login(user1)
      delete :destroy, params: { id: 3 }, format: :json
      expect(response).to have_http_status(:forbidden)
    end

    it "destroys a relationship with good params" do
      login(admin)
      delete :destroy, params: { id: relationship.id }, format: :json
      expect(response).to have_http_status(:ok)
    end

    it "returns errors with bad params" do
      login(admin)
      delete :destroy, params: { id: 222939 }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end
end
