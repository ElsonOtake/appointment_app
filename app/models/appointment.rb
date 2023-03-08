class Appointment < ApplicationRecord
  validates :booking, presence: true

  scope :ordered, -> { order(id: :desc) }
end
