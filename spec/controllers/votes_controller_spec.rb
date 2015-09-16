require 'rails_helper'

RSpec.describe VotesController, type: :controller do

  describe "GET #index" do
    it "populates an array of votes" do
      vote = FactoryGirl.create(:vote)
      get :index
      expect(assigns(:votes)).to eq([vote])
    end

    context "when format.html" do
      it "renders the :index view" do
        get :index
        expect(response).to render_template('index')
      end
    end

    context "when format.csv" do
      it "renders the :index csv format" do
        get :index, format: :csv
        header = response.headers
        expect(header['Content-Disposition']).to eq("attachment; filename=\"cat-votes.csv\"")
        expect(header['Content-Type']).to eq("text/csv")
      end
    end
  end

  describe "GET #new" do
    it "assigns a new vote to @vote" do
      get :new
      expect(assigns(:vote)).to be_a_new(Vote)
    end

    it "redirects to the 404 page, no template" do
      get :new
      expect(response).to redirect_to '/404'
    end
  end

  describe "POST #create" do

    context "with valid attributes" do
      it "creates a new vote" do
        expect{
          post :create, vote: FactoryGirl.attributes_for(:vote)
        }.to change(Vote, :count).by(1)
      end

      it "redirects to the vote index page" do
        post :create, vote: FactoryGirl.attributes_for(:vote)
        expect(response).to redirect_to votes_url
      end
    end

  end

  describe "DELETE #destroy" do
    before :each do
      @vote = FactoryGirl.create(:vote)
    end

    it "deletes the vote" do
      expect{
        delete :destroy, id: @vote
      }.to change(Vote, :count).by(-1)
    end

    it "redirects to the votes index page" do
      delete :destroy, id: @vote
      expect(response).to redirect_to votes_url
    end
  end

end
