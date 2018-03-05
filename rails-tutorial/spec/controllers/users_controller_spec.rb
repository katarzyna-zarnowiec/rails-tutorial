require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#index" do
    let(:users_count) { 5 }
    let!(:users) { create_list(:user, users_count) }

    it "returns users" do
      get :index

      expect(parsed_response).not_to be_empty
      expect(parsed_response.size).to eq(users_count)
    end

    it "returns status code 200" do
      get :index

      expect(response).to have_http_status(200)
    end
  end

  describe "#show" do
    let(:user_id) { 23 }
    let!(:user) { create(:user, id: user_id) }

    it "returns user" do
      get :show, params: { id: user_id }

      expect(parsed_response).not_to be_empty
      expect(parsed_response["name"]).to eq(user.name)
    end

    it "returns status code 200" do
      get :show, params: { id: user_id }

      expect(response).to have_http_status(200)
    end
  end
end
