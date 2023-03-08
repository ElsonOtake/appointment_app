require 'rails_helper'

RSpec.describe Appointment, type: :model do
  before(:each) do
    @appointment = Appointment.new(booking: Date.today.to_s)
  end

  it 'is valid with valid attributes' do
    expect(@appointment).to be_valid
  end

  it 'is not valid without a booking' do
    @appointment.booking = nil
    expect(@appointment).to_not be_valid
  end

  it 'Booking must not be blank' do
    @appointment.booking = ' '
    expect(@appointment).to_not be_valid
  end
end
