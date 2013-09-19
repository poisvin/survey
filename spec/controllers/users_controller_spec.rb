require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

	describe "Sign up" do
		describe "with valid credentials" do

	    it "should redirect to root url on sign up" do
	    	post :create, :user => FactoryGirl.attributes_for(:user_login)
	       response.should redirect_to root_url
	    end

	    it "should have created a new user" do
	      expect {
	        post :create, :user => FactoryGirl.attributes_for(:user_login)
	      }.to change(User, :count).by(1)
	    end
    end

    it "should return new template on invalid credentials " do
      post :create, :user => FactoryGirl.attributes_for(:invalid_user_login)
      response.should render_template :new
    end
  end

end
