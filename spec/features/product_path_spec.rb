require "rails_helper"

describe "the product management path" do
  before do
    @user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_on "Log in"
  end

  it "allows an admin to create a new product" do
    @user.update(admin: true)
    visit products_path
    click_on "New Product"
    fill_in "Name", with: "Fish"
    fill_in "Description", with: "Good fish"
    fill_in "Price", with: 20
    click_button "Save"
    expect(page).to have_content("Fish")
  end

  it "does not allow a non-admin to add products"  do
    @user.update(admin: false)
    visit new_product_path
    expect(page).to have_no_content("New Product")
  end
  
end