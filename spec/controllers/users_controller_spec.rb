require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

 #  describe "Login" do
		
	# end

	describe "Sign up" do
		describe "with valid credentials" do
			before :each do 
	    	@user = {:email => "helloworld@yopmail.com", :password => "123456", :password_confirmation => "123456"}
			end

	    it "should redirect to root url on sign up" do
	      post :create, user: @user
	      response.should redirect_to root_url
	    end

	    it "should have created a new user" do
	      expect {
	        post :create, {:user => @user}
	      }.to change(User, :count).by(1)
	    end
    end

    it "should return new template on invalid credentials " do
      user = {:email => "helloworld@yopmail.com", :password => "", :password_confirmation => ""}
      post :create, user: user
      response.should render_template :new
    end
  end
	




end
