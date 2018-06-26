require 'rails_helper'

RSpec.describe Api::V1::Admin::UsersController, type: :controller do
  let(:admin) { create(:admin) }
  let(:user1) { create(:user) }

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


    it "list users" do
      login(admin)
      user1
      get :index, format: :json
      expect(json_response.count).to eq(2)
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

    it "creates a new user with good params" do
      login(admin)
      post :create, params: { user: {name: "lorem ipsum", nickname: "ana", email: "ana@ana.com", password: "asdfasdf"} }, format: :json
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

    it "updates the user" do
      login(admin)
      put :update, params: { id: user1.id, user: { admin: true } }, format: :json
      expect(json_response[:admin]).to eq(true)
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

    it "destroys a user with good params" do
      login(admin)
      delete :destroy, params: { id: user1.id }, format: :json
      expect(response).to have_http_status(:ok)
    end

    it "returns errors with bad params" do
      login(admin)
      delete :destroy, params: { id: 222939 }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end
end
