require 'rails_helper'

feature "Authentication:" do

  scenario "Existing users can log in" do
    visit "/login"
    user = FactoryGirl.create(:user)
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on "Login"
    expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario "Non-existing users cannot sign in" do
    visit "/login"
    fill_in :username, with: "random"
    fill_in :password, with: "password"
    click_on "Login"
    expect(page).to have_content("Incorrect username or password")
  end

  scenario "Logout" do
    visit "/login"
    user = FactoryGirl.create(:user)
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on "Login"
    click_link "Logout"
    expect(page).to_not have_content "#{user.username}"
  end

end
