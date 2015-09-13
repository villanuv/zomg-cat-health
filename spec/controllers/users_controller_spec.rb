require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "populates an array of users" do
      user = FactoryGirl.create(:user)
      get :index
      expect(assigns(:users)).to eq([user])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = FactoryGirl.create(:user)
      get :show, id: user
      expect(assigns(:user)).to eq(user)
    end

    it "renders the :show view" do
      get :show, id: FactoryGirl.create(:user)
      expect(response).to render_template('show')
    end
  end

  describe "GET #new" do
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the :new view" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "GET #edit" do
    it "assigns the requested user to @user" do
      user = FactoryGirl.create(:user)
      get :edit, id: user
      expect(assigns(:user)).to eq(user)
    end

    it "renders the :edit view" do
      get :edit, id: FactoryGirl.create(:user)
      expect(response).to render_template('edit')
    end
  end

  describe "PUT #update" do
    before :each do
      @user = FactoryGirl.create(:user, username: "admin", password: "password", password_confirmation: "password")
    end

    context "valid attributes" do
      it "located the requested @user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        expect(assigns(:user)).to eq(@user)
      end

      it "changes @user's attributes" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user, username: "newuser", password: "newpassword", password_confirmation: "newpassword")
        @user.reload
        expect(@user.username).to eq('newuser')
        expect(@user.password).to eq('password')
      end

      it "redirects to the updated user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to @user
      end
    end

    context "invalid attributes" do
      it "locates the requested @user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user)
        expect(assigns(:user)).to eq(@user)  
      end

      it "does not change @user's attributes" do
        put :update, id: @user, 
          user: FactoryGirl.attributes_for(:user, username: "newuser", password: "password", password_confirmation: nil)
        @user.reload
        expect(@user.username).to_not eq("newuser")
        expect(@user.password).to eq("password")
      end

      it "re-renders the edit user page with error" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user)
        expect(assigns(:error)).to eq('Update error. Try again.')
        expect(response).to render_template('edit')
      end
    end

  end

  describe "POST #create" do

    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to the new user" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to User.last
      end
    end

    context "invalid attributes" do
      it "does not save the new user" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:invalid_user)
        }.to_not change(User, :count)
      end

      it "re-renders the new user page with error" do
        post :create, user: FactoryGirl.attributes_for(:invalid_user)
        expect(assigns(:error)).to eq('Create error. Try again.')
        expect(response).to render_template('new')
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @user = FactoryGirl.create(:user, username: "admin", password: "password", password_confirmation: "password")
    end

    it "deletes the user" do
      expect{
        delete :destroy, id: @user
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users index page" do
      delete :destroy, id: @user
      expect(response).to redirect_to users_url
    end
  end

end
