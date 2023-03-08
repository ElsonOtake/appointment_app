require 'rails_helper'

RSpec.describe 'Index page', type: :feature do
  before(:each) do
    @appointment = Appointment.create(booking: Date.today.to_s)
  end

  it 'will present index page' do
    visit '/appointments'
    expect(current_path).to eq(appointments_path)
  end

  it 'will have page content' do
    visit appointments_path
    expect(page).to have_content('Appointments')
    expect(page).to have_content(Date.today.to_s)
  end

  it 'will have link to "New appointment" and "Edit"' do
    visit appointments_path
    expect(page).to have_link('New appointment')
    expect(page).to have_link('Edit')
  end

  it 'will have a "Delete" button' do
    visit appointments_path
    expect(page).to have_button('Delete')
  end

  it 'will have Tailwind classes' do
    visit appointments_path
    expect(page).to have_css('.w-full')
    expect(page).to have_css('.px-2')
    expect(page).to have_css('.mx-auto')
    expect(page).to have_css('.flex')
    expect(page).to have_css('.flex-wrap')
    expect(page).to have_css('.items-center')
    expect(page).to have_css('.justify-between')
    expect(page).to have_css('.gap-3')
    expect(page).to have_css('.text-4xl')
    expect(page).to have_css('.font-bold')
    expect(page).to have_css('.text-gray-800')
  end

  it 'will go to new appointment page when click on link "New appointment"' do
    visit appointments_path
    click_link 'New appointment'
    expect(current_path).to eq(new_appointment_path)
  end

  it 'will go to edit appointment page when click on link "Edit"' do
    visit appointments_path
    click_link 'Edit'
    expect(current_path).to eq(edit_appointment_path(@appointment))
  end
end
