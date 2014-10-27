require 'spec_helper'
 def stub_env_for_omniauth
  # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
  request.env["devise.mapping"] = Devise.mappings[:user]
  env = { "omniauth.auth" => { "provider" => "facebook", "uid" => "1234", "extra" => { "user_hash" => { "email" => "ghost@nobody.com" } } } }
  @controller.stub!(:env).and_return(env)
end
describe Users::OauthCallbacksController, "handle facebook authentication callback" do
  before do 
  request.env["devise.mapping"] = Devise.mappings[:user] # If using Devise
  request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] 
end
  describe "#annonymous user" do
    context "when facebook email doesn't exist in the system" do
      before(:each) do
        stub_env_for_omniauth
 
        get :facebook
        @user = User.where(:email => "ghost@nobody.com").first
      end
 
      it { @user.should_not be_nil }
 
      it "should create authentication with facebook id" do
        authentication = @user.authentications.where(:provider => "facebook", :uid => "1234").first
        authentication.should_not be_nil
      end
 
      it { should be_user_signed_in }
 
      it { response.should redirect_to tasks_path }
    end
    
    context "when facebook email already exist in the system" do
      before(:each) do
        stub_env_for_omniauth
        
        User.create!(:email => "ghost@nobody.com", :password => "my_secret")
        get :facebook
      end
      
      it { flash[:notice].should == "Your email ghost@nobody.com is already exist in the system. You need to sign in first."}
      
      it { response.should redirect_to new_user_session_path }
    end
  end
  
  describe "#logged in user" do
    context "when user don't have facebook authentication" do
      before(:each) do
        stub_env_for_omniauth
 
        user = User.create!(:email => "user@example.com", :password => "my_secret")
        sign_in user
 
        get :facebook
      end
 
      it "should add facebook authentication to current user" do
        user = User.where(:email => "user@example.com").first
        user.should_not be_nil
        fb_authentication = user.authentications.where(:provider => "facebook").first
        fb_authentication.should_not be_nil
        fb_authentication.uid.should == "1234"
      end
 
      it { should be_user_signed_in }
 
      it { response.should redirect_to authentications_path }
      
      it { flash[:notice].should == "Facebook is connected with your account."}
    end
    
    context "when user already connect with facebook" do
      before(:each) do
        stub_env_for_omniauth
        
        user = User.create!(:email => "ghost@nobody.com", :password => "my_secret")
        user.authentications.create!(:provider => "facebook", :uid => "1234")
        sign_in user
 
        get :facebook
      end
      
      it "should not add new facebook authentication" do
        user = User.where(:email => "ghost@nobody.com").first
        user.should_not be_nil
        fb_authentications = user.authentications.where(:provider => "facebook")
        fb_authentications.count.should == 1
      end
      
      it { should be_user_signed_in }
      
      it { flash[:notice].should == "Signed in successfully." }
      
      it { response.should redirect_to tasks_path }
      
    end
  end
  
end
 
