require 'rails_helper'

feature "Cat form characters:" do

  scenario "new cat pages will show 40 character remaining" do
    visit "/login"
    user = FactoryGirl.create(:user)
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on "Login"
    visit "/cats/new"
    expect(page).to have_content("40")
  end

  feature "shows characters remaining in edit cat page" do
    pending "Works, but still having test issues."
  end

  feature "will update remaining characters as you type" do
    pending "Works, but still having test issues."
  end

end