require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  let(:user) { create(:user) }
  let(:room) { create(:room) }
  let(:hotel) { create(:hotel) }
  let(:booking) { create(:booking, check_in_date: Date.today, check_out_date: Date.today, number_of_rooms: 2, room_id: room.id, user_id: user.id ) }

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new booking" do
        expect {
        post :create, params: { booking: { check_in_date: Date.tomorrow, check_out_date: Date.tomorrow, number_of_rooms: 2, room_id: room.id, user_id: user.id } }
      }.to change(Booking, :count)
        expect(response).to have_http_status(:created)
      end
    end
    
    context "with invalid parameters" do
      it "does not create a new booking" do
        expect {
          post :create, params: { booking: { check_in_date: Date.today, check_out_date: Date.yesterday, number_of_rooms: 2, room_id: room.id } }
        }.to_not change(Booking, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      it "updates the booking" do
        patch :update, params: { id: booking.id, booking: { check_in_date: Date.tomorrow, check_out_date: Date.tomorrow, number_of_rooms: 3} }
        expect(booking.reload.number_of_rooms).to eq(3)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the booking" do
      delete :destroy, params: { id: booking.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end