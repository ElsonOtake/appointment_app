require 'rails_helper'

RSpec.describe 'Edit page', type: :feature do
  before(:each) do
    @appointment = Appointment.create(booking: Date.today.to_s)
  end

  it 'will present edit appointment page' do
    visit "/appointments/#{@appointment.id}/edit"
    expect(current_path).to eq(edit_appointment_path(@appointment))
  end

  it 'will have page content' do
    visit edit_appointment_path(@appointment)
    expect(page).to have_content('Editing appointment')
  end

  it 'will have link to "Back to appointment" and "Cancel"' do
    visit edit_appointment_path(@appointment)
    expect(page).to have_link('Back to appointment')
    expect(page).to have_link('Cancel')
  end

  it 'will have Tailwind classes' do
    visit edit_appointment_path(@appointment)
    expect(page).to have_css('.w-full')
    expect(page).to have_css('.px-2')
    expect(page).to have_css('.mx-auto')
    expect(page).to have_css('.flex')
    expect(page).to have_css('.flex-wrap')
    expect(page).to have_css('.items-center')
    expect(page).to have_css('.justify-between')
    expect(page).to have_css('.gap-3')
  end

  it 'will go to detail page when click on link "Back to appointment"' do
    visit edit_appointment_path(@appointment)
    click_link 'Back to appointment'
    expect(current_path).to eq(appointment_path(@appointment))
  end

  it 'will go back to index page when click on link "Cancel"' do
    visit edit_appointment_path(@appointment)
    click_link 'Cancel'
    expect(current_path).to eq(appointments_path)
  end
end
