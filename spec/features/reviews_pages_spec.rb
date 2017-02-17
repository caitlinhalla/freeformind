require 'rails_helper'

describe 'the reviews path' do
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

  it 'allows users to edit their reviews' do
    user = FactoryGirl.create(:user)
    product = FactoryGirl.create(:product)
    review = FactoryGirl.create(:review, :user_id => user.id, :product_id => product.id)
    visit new_user_session_path
    fill_in "Email", :with => "caitlin@caitlin.com"
    fill_in "Password", :with => "password"
    click_button "Log in"
    visit edit_product_review_path(product, review)
    fill_in "Author", :with => "You"
    click_button "Save"
    expect(page).to have_content("You")
  end
end
