require 'rails_helper'

RSpec.describe HotelsController, type: :controller do
  describe "GET #index" do
    context "when location parameter is present" do
      let(:location) { "New York" }
      it "returns hotels filtered by location" do
        hotel1 = create(:hotel, location: location)
        get :index, params: { location: hotel1.location }
        expect(response).to have_http_status(:ok)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response.first["location"]).to eq(hotel1.location)
      end
    end

    context "when location parameter is not present" do
      it "returns all hotels" do
        hotel1 = create(:hotel)
        hotel2 = create(:hotel)
        get :index
        expect(response).to have_http_status(:ok)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response.count).to eq(2)
      end
    end
  end
end