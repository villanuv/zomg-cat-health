require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "renders new template" do
      get :new
    end
  end

  # create and destroy methods
  # tested with Capybara through features/login_spec.rb

end