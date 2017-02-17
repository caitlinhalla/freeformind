require 'rails_helper'

describe 'sign up/in process' do
  it 'allows users to sign up' do
    visit new_user_registration_path
    fill_in "Email", :with => "new@test.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button 'Sign up'
    expect(page).to have_content("new@test.com")
  end

  it 'allows users to sign in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", :with => "caitlin@caitlin.com"
    fill_in "Password", :with => "password"
    click_button "Log in"
    expect(page).to have_content("caitlin@caitlin.com")
  end
end
