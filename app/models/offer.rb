class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :date, inclusion: { in: %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday),
  }
  validates :duration, presence: true
end
