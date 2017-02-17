require 'rails_helper'

describe 'the products index path' do
  it 'displays all products' do
    user = FactoryGirl.create(:user)
    product = FactoryGirl.create(:product, :user_id => user.id)
    visit new_user_session_path
    fill_in "Email", :with => "caitlin@caitlin.com"
    fill_in "Password", :with => "password"
    click_button "Log in"
    visit products_path
    expect(page).to have_content(product.name)

  end
end
