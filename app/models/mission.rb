class Mission < ApplicationRecord
  belongs_to :listing

  enum mission_type: {
    first_checkin: 0,
    last_checkout: 10,
    checkin_checkout: 20
  }

  validates :price, numericality: { greater_or_equal_to: 0 }
  validates :date, presence: true
end

