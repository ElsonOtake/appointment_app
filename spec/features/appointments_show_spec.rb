require 'rails_helper'

RSpec.describe 'Show page', type: :feature do
  before(:each) do
    @appointment = Appointment.create(booking: Date.today.to_s)
  end

  it 'will present details page' do
    visit "/appointments/#{@appointment.id}"
    expect(current_path).to eq(appointment_path(@appointment))
  end

  it 'will have page content' do
    visit appointment_path(@appointment)
    expect(page).to have_content(Date.today.to_s)
  end

  it 'will have link to "Back to appointments"' do
    visit appointment_path(@appointment)
    expect(page).to have_link('Back to appointments')
    expect(page).to have_link('Edit')
  end

  it 'will have a "Delete" button' do
    visit appointment_path(@appointment)
    expect(page).to have_button('Delete')
  end

  it 'will have Tailwind classes' do
    visit appointment_path(@appointment)
    expect(page).to have_css('.w-full')
    expect(page).to have_css('.px-2')
    expect(page).to have_css('.mx-auto')
    expect(page).to have_css('.bg-white')
    expect(page).to have_css('.rounded-md')
    expect(page).to have_css('.shadow-sm')
    expect(page).to have_css('.mb-4')
    expect(page).to have_css('.p-2')
  end

  it 'will go back to index page when click on link "Back to appointments"' do
    visit appointment_path(@appointment)
    click_link 'Back to appointments'
    expect(current_path).to eq(appointments_path)
  end
end
