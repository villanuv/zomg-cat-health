require 'rails_helper'

RSpec.describe CatsController, type: :controller do

  describe "GET #index" do
    it "populates an array of cats" do
      cat = FactoryGirl.create(:cat)
      get :index
      expect(assigns(:cats)).to eq([cat])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "GET #show" do
    it "assigns the requested cat to @cat" do
      cat = FactoryGirl.create(:cat)
      get :show, id: cat
      expect(assigns(:cat)).to eq(cat)
    end

    it "renders the :show view" do
      get :show, id: FactoryGirl.create(:cat)
      expect(response).to render_template('show')
    end
  end

  describe "GET #new" do
    it "assigns a new cat to @cat" do
      get :new
      expect(assigns(:cat)).to be_a_new(Cat)
    end

    it "renders the :new view" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "GET #edit" do
    it "assigns the requested cat to @cat" do
      cat = FactoryGirl.create(:cat)
      get :edit, id: cat
      expect(assigns(:cat)).to eq(cat)
    end

    it "renders the :edit view" do
      get :edit, id: FactoryGirl.create(:cat)
      expect(response).to render_template('edit')
    end
  end

  describe "PUT #update" do
    before :each do
      @cat = FactoryGirl.create(:cat, url: "http://www.website.com/sample.jpg", description: "lorem ipsum dolor", user_id: 1)
    end

    context "valid attributes" do
      it "located the requested @cat" do
        put :update, id: @cat, cat: FactoryGirl.attributes_for(:cat)
        expect(assigns(:cat)).to eq(@cat)
      end

      it "changes @cat's attributes" do
        put :update, id: @cat, cat: FactoryGirl.attributes_for(:cat, url: "http://www.website.com/other_sample.jpg", description: "lorem ipsum dolor", user_id: 1)
        @cat.reload
        expect(@cat.url).to eq('http://www.website.com/other_sample.jpg')
        expect(@cat.description).to eq('lorem ipsum dolor')
        expect(@cat.user_id).to eq(1)
      end

      it "redirects to the updated cat" do
        put :update, id: @cat, cat: FactoryGirl.attributes_for(:cat)
        expect(response).to redirect_to @cat
      end
    end

    context "invalid attributes" do
      it "locates the requested @cat" do
        put :update, id: @cat, cat: FactoryGirl.attributes_for(:invalid_cat)
        expect(assigns(:cat)).to eq(@cat)  
      end

      it "does not change @cat's attributes" do
        put :update, id: @cat, 
          cat: FactoryGirl.attributes_for(:cat, url: "http://www.website.com/other_sample.jpg", description: nil, user_id: 1)
        @cat.reload
        expect(@cat.url).to_not eq('http://www.website.com/other_sample.jpg')
        expect(@cat.description).to eq('lorem ipsum dolor')
        expect(@cat.user_id).to eq(1)
      end

      it "re-renders the edit cat page with error" do
        put :update, id: @cat, cat: FactoryGirl.attributes_for(:invalid_cat)
        expect(assigns(:error)).to eq('Update error. Try again.')
        expect(response).to render_template('edit')
      end
    end

  end  

  describe "POST #create" do

    context "with valid attributes" do
      it "creates a new cat" do
        expect{
          post :create, cat: FactoryGirl.attributes_for(:cat)
        }.to change(Cat, :count).by(1)
      end

      it "redirects to the new cat" do
        post :create, cat: FactoryGirl.attributes_for(:cat)
        expect(response).to redirect_to Cat.last
      end
    end

    context "invalid attributes" do
      it "does not save the new cat" do
        expect{
          post :create, cat: FactoryGirl.attributes_for(:invalid_cat)
        }.to_not change(Cat, :count)
      end

      it "re-renders the new cat page with error" do
        post :create, cat: FactoryGirl.attributes_for(:invalid_cat)
        expect(assigns(:error)).to eq('Create error. Try again.')
        expect(response).to render_template('new')
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @cat = FactoryGirl.create(:cat, url: "http://www.website.com/sample.jpg", description: "lorem ipsum dolor", user_id: 1)
    end

    it "deletes the cat" do
      expect{
        delete :destroy, id: @cat
      }.to change(Cat, :count).by(-1)
    end

    it "redirects to the cats index page" do
      delete :destroy, id: @cat
      expect(response).to redirect_to cats_url
    end
  end

end
