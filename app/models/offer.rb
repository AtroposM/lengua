class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :date, presence: true

  validates :duration, :date, :level, :language, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
