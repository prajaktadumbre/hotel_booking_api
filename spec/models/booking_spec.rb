require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'validations' do
    let(:user) { FactoryBot.create(:user) }
    let(:room) { FactoryBot.create(:room) }
    it 'prevents booking the same room for the same date range' do
      FactoryBot.create(:booking, room: room, check_in_date: '2024-04-01', check_out_date: '2024-04-03')
      booking = FactoryBot.build(:booking, room: room, check_in_date: '2024-04-01', check_out_date: '2024-04-03')
      expect(booking).not_to be_valid
      expect(booking.errors[:base]).to include('This room is already booked for the selected dates')
    end
  end
end