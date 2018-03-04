require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:users) { create_list(:user, users_count) }
  let(:users_count) { 5 }

  describe "#index" do
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
end
