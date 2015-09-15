require 'rails_helper'

feature "Voting:" do

  scenario "Vote registers after selecting cat button" do
    cats = 5.times { FactoryGirl.create(:cat) }
    user = FactoryGirl.create(:user)

    visit "/login"
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on "Login"

    expect {
      click_on "ZOMG! Cute!"
    }.to change(Vote, :count).from(0).to(1)

    visit '/votes'
    last_entry = find('table tbody tr:last-child').text
    expect(last_entry).to have_content('ZOMG! Cute!')

    click_on "Logout"
  end

end