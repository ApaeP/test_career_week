class Reservation < ApplicationRecord
  include DateRangeValidator

  belongs_to :listing

  after_create :create_associated_missions

  private

  def create_associated_missions
    return if last_checkout_mission_exists?

    Mission.create(listing:, date: end_date, price: 10 * listing.num_rooms, mission_type: :checkin_checkout)
  end

  def last_checkout_mission_exists?
    Mission.where(listing: listing, date: end_date, mission_type: :last_checkout).exists?
  end
end
