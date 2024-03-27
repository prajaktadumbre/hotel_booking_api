class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validate :check_room_availability

  private

  def check_room_availability
    if Booking.exists?(room_id: room_id, check_in_date: check_in_date..check_out_date)
      errors.add(:base, "This room is already booked for the selected dates")
    end
  end
end