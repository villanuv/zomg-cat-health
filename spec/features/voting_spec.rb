require 'rails_helper'

feature "Voting:" do

  context "logged in" do
    before do
      cats = 5.times { FactoryGirl.create(:cat) }
      user = FactoryGirl.create(:user)

      visit "/login"
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on "Login"
    end

    scenario "Vote registers after selecting 'ZOMG' button" do
      expect {
        click_on "ZOMG! Cute!"
      }.to change(Vote, :count).from(0).to(1)

      visit '/votes'
      last_entry = find('table tbody tr:last-child').text
      expect(last_entry).to have_content('ZOMG! Cute!')
    end

    scenario "Vote registers after selecting 'Amazing' button" do
      expect {
        click_on "Amazing! So Beautiful!"
      }.to change(Vote, :count).from(0).to(1)

      visit '/votes'
      last_entry = find('table tbody tr:last-child').text
      expect(last_entry).to have_content('Amazing! So Beautiful!')
    end

    after do
      click_on "Logout"
    end
  end

  context "anonymous user" do
    before do
      cats = 5.times { FactoryGirl.create(:cat) }
    end

    scenario "Vote registers after selecting 'ZOMG' button" do
      visit '/'

      expect {
        click_on "ZOMG! Cute!"
      }.to change(Vote, :count).from(0).to(1)

      visit "/login"
      user = FactoryGirl.create(:user)
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on "Login"

      visit '/votes'
      last_entry = find('table tbody tr:last-child').text
      expect(last_entry).to have_content('ZOMG! Cute!')
    end

    scenario "Vote registers after selecting 'Amazing' button" do
      visit '/'

      expect {
        click_on "Amazing! So Beautiful!"
      }.to change(Vote, :count).from(0).to(1)

      visit "/login"
      user = FactoryGirl.create(:user)
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on "Login"

      visit '/votes'
      last_entry = find('table tbody tr:last-child').text
      expect(last_entry).to have_content('Amazing! So Beautiful!')
    end

  end
end