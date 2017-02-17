require 'rails_helper'

describe 'the create reviews path' do
  it 'allows users to add a review' do
    user = FactoryGirl.create(:user)
    product = FactoryGirl.create(:product, :user_id => user.id)
    visit new_user_session_path
    fill_in "Email", :with => "caitlin@caitlin.com"
    fill_in "Password", :with => "password"
    click_button "Log in"
    visit product_path(product)
    click_link "New Review"
    fill_in "Author", :with => "Me"
    fill_in "Content", :with => "Content"
    fill_in "Rating", :with => 5
    click_button "Save"
    expect(page).to have_content("Me")
  end

  it 'redirects to product if review is not saved' do
    user = FactoryGirl.create(:user)
    product = FactoryGirl.create(:product, :user_id => user.id)
    visit new_user_session_path
    fill_in "Email", :with => "caitlin@caitlin.com"
    fill_in "Password", :with => "password"
    click_button "Log in"
    visit product_path(product)
    click_link "New Review"
    click_button "Save"
    expect(page).to have_content("Oops!")
  end

end
