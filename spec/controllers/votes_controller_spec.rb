require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  render_views 

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
        expect(request.headers).to_not be(nil)
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested vote to @vote" do
      vote = FactoryGirl.create(:vote)
      get :show, id: vote
      expect(assigns(:vote)).to eq(vote)
    end

    it "does NOT render the :show view" do
      get :show, id: FactoryGirl.create(:vote)
      expect(response).to_not render_template('show')
    end
  end

  describe "GET #new" do
    it "assigns a new vote to @vote" do
      get :new
      expect(assigns(:vote)).to be_a_new(Vote)
    end

    it "does NOT render the :new view" do
      get :new
      expect(response).to_not render_template('new')
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
      @vote = FactoryGirl.create(:vote, option: 0, ip_address: "10.0.0.1", cat_id: 1)
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
