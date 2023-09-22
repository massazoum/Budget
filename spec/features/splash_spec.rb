require 'rails_helper'

RSpec.describe 'Splash page', type: :feature do
  it 'displays the welcome message and links' do
    visit root_path
    expect(page).to have_content('Welcome to Budget Manager')
    expect(page).to have_content('Track and manage your budget with ease!')
    expect(page).to have_link('Sign Up', href: new_user_registration_path)
    expect(page).to have_link('Log In', href: new_user_session_path)
  end
end
