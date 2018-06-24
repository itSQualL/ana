require 'rails_helper'

RSpec.describe Api::V1::RelationshipsController, type: :controller do

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  describe 'GET index' do
    it "requires the user to be logged in" do
      get :index, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "lists users" do
      login(user1)
      user1.follow(user2.id)
      get :index, params: { type: "pending_followees" }, format: :json
      expect(json_response.count).to eq(1)
    end
  end

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

  describe 'PUT update' do
    it "requires the user to be logged in" do
      put :update, params: { id: 22 }, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "updates the status of relationship" do
      login(user1)
      user2.follow(user1.id)
      put :update, params: { id: user2.id, allowed: true }, format: :json
      expect(json_response[:allowed]).to eq(true)
    end
  end

  describe 'DELETE destroy' do
    it "requires the user to be logged in" do
      delete :destroy, params: { id: user2.id }, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "destroys a relationship with good params" do
      login(user1)
      user1.follow(user2.id)
      delete :destroy, params: { id: user2.id }, format: :json
      expect(response).to have_http_status(:ok)
    end

    it "returns errors with bad params" do
      login(user1)
      user1.follow(user2.id)
      delete :destroy, params: { id: 222939 }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end

end
