class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :date, inclusion: { in: %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday),
  }
  validates :duration, :date, :level, :language, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
