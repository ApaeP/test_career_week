class Booking < ApplicationRecord
  include DateRangeValidator

  belongs_to :listing

  after_create :create_associated_missions

  private

  def create_associated_missions
    Mission.create(listing:, date: self.start_date, price: 10 * listing.num_rooms, mission_type: :first_checkin)
    Mission.create(listing:, date: self.end_date, price: 5 * listing.num_rooms, mission_type: :last_checkout)
  end
end
