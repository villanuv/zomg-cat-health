require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "renders new template" do
      get :new
    end
  end

  describe "CREATE and DESTROY" do
    pending "Tested with Capybara, features/login_spec.rb"
  end

end