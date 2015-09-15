require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "homepage" do
    it "assigns @cats to two random cats in database" do
      cat = 5.times { FactoryGirl.create(:cat) }
      get :index
      expect(assigns(:cats).size).to eq(2)
    end

    it "assigns @ip to visitor's ip address" do
      get :index
      expect(assigns(:ip)).to eq('0.0.0.0')
    end

    it "assigns a new vote to @vote" do
      get :index
      expect(assigns(:vote)).to be_a_new(Vote)
    end
  end

end