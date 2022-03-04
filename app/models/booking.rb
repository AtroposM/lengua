class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :status, presence: true
end
