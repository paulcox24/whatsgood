require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  before do 
    user = FactoryGirl.create(:login_user)
    sign_in user 
  end

  describe 'GET index' do

    it 'successfully gets the index page' do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'assigns the @users variable' do
      get :index
      expect(assigns(:users)).to eq(User.all)
    end

    it 'redirects if not admin' do 
      user = FactoryGirl.create(:first_user)
      sign_in user 
      get :index
      expect(response).to redirect_to(root_path) 
    end
  end

  describe "GET profile" do

    it "returns http success" do
      user = FactoryGirl.create(:login_user)
      get :profile, user_id: user
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:profile)
    end

     it 'assigns the requested user to @user' do
      user = FactoryGirl.create(:login_user)
      get :profile, user_id: user
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "PUT update" do

    context 'with valid attributes' do
      it 'located the requested @user' do
        user = FactoryGirl.create(:first_user)
        patch :update, id: user, user: FactoryGirl.attributes_for(:second_user)
        expect(assigns(:user)).to eq(user)
      end
    
      it 'redirects to the updated profile' do
        user = FactoryGirl.create(:first_user)
        patch :update, id: user, user: FactoryGirl.attributes_for(:second_user)
        expect(response).to redirect_to user_profile_path(user)
      end
    end

    context 'with invalid attributes' do
    
      it 'renders the edit template' do
        user = FactoryGirl.create(:first_user)
        patch :update, id: user, user: FactoryGirl.attributes_for(:invalid_user)
        expect(response).to render_template :edit
      end
    end

    it 'redirects if not admin' do 
      user = FactoryGirl.create(:first_user)
      sign_in user 
      patch :update, id: user, user: FactoryGirl.attributes_for(:second_user)
      expect(response).to redirect_to(root_path) 
    end
  end

  describe 'DELETE destroy' do
    
    it 'deletes the project' do
      user = FactoryGirl.create(:first_user)
      expect{
        delete :destroy, id: user
      }.to change(User,:count).by(-1)
    end
      
    it 'redirects to project#index' do
      user = FactoryGirl.create(:first_user)
      delete :destroy, id: user
      expect(response).to redirect_to users_path
    end

    it 'redirects if not admin' do 
      user = FactoryGirl.create(:first_user)
      sign_in user 
      delete :destroy, id: user
      expect(response).to redirect_to(root_path) 
    end
  end

end
