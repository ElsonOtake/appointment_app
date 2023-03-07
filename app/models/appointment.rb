class Appointment < ApplicationRecord
  validates :booking, presence: true
end
