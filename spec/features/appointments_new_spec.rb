require 'rails_helper'

RSpec.describe 'New page', type: :feature do
  it 'will present new appointment page' do
    visit '/appointments/new'
    expect(current_path).to eq(new_appointment_path)
  end

  it 'will have page content' do
    visit new_appointment_path
    expect(page).to have_content('New appointment')
  end

  it 'will have link to "Back to appointments" and "Cancel"' do
    visit new_appointment_path
    expect(page).to have_link('Back to appointments')
    expect(page).to have_link('Cancel')
  end

  it 'will not have a "Delete" button' do
    visit new_appointment_path
    expect(page).to_not have_button('Delete')
  end

  it 'will have Tailwind classes' do
    visit new_appointment_path
    expect(page).to have_css('.w-full')
    expect(page).to have_css('.px-2')
    expect(page).to have_css('.mx-auto')
    expect(page).to have_css('.flex')
    expect(page).to have_css('.flex-wrap')
    expect(page).to have_css('.items-center')
    expect(page).to have_css('.justify-between')
    expect(page).to have_css('.gap-3')
  end

  it 'will go back to index page when click on link "Back to appointments"' do
    visit new_appointment_path
    click_link 'Back to appointments'
    expect(current_path).to eq(appointments_path)
  end

  it 'will go back to index page when click on link "Cancel"' do
    visit new_appointment_path
    click_link 'Cancel'
    expect(current_path).to eq(appointments_path)
  end
end
