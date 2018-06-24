require 'rails_helper'

RSpec.describe Api::V1::NotesController, type: :controller do
  let(:user1) { create(:user) }

  let(:note) { create(:note, user: user1) }

  describe 'GET index' do
    it "requires the user to be logged in" do
      get :index, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "list user notes" do
      login(user1)
      note
      get :index, format: :json
      expect(json_response.count).to eq(1)
    end
  end

  describe 'POST create' do
    it "requires the user to be logged in" do
      post :create, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "creates a new note with good params" do
      login(user1)
      post :create, params: { note: {body: "lorem ipsum", shared: false} }, format: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT update' do
    it "requires the user to be logged in" do
      put :update, params: { id: 22 }, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "updates the note" do
      login(user1)
      put :update, params: { id: note.id, note: { shared: true } }, format: :json
      expect(json_response[:shared]).to eq(true)
    end
  end

  describe 'DELETE destroy' do
    it "requires the user to be logged in" do
      delete :destroy, params: { id: note.id }, format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "destroys a note with good params" do
      login(user1)
      delete :destroy, params: { id: note.id }, format: :json
      expect(response).to have_http_status(:ok)
    end

    it "returns errors with bad params" do
      login(user1)
      delete :destroy, params: { id: 222939 }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end




end
