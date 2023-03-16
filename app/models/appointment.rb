class Appointment < ApplicationRecord
  validates :booking, presence: true

  scope :ordered, -> { order(id: :desc) }

  broadcasts_to ->(appointment) { 'appointments' }, inserts_by: :prepend
end
