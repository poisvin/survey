require 'spec_helper'

describe ResponsesController do
	before :each do
    @survey = Enquete.create!(:title => "trial")
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end


  describe "GET new" do
    it "response should be successful" do
      get :new, :enquete_id => @survey
      response.should be_success
    end

    it "should be a new response" do
      get :new, :enquete_id => @survey
      assigns(:response).should be_a_new(Response)
    end

    it "should redirect to show page." do
    	myresponse = Response.create!({ :enquete_id => @survey.id, :user_id => @user.id, :answers_attributes => [] })
      get :new, :enquete_id => @survey
      response.should redirect_to(enquete_response_path(@survey, Response.last))
    end
  end

  describe "POST create" do
    describe "with valid params" do
	  	before :each do 
	  		@myresponse = { :enquete_id => @survey.id, :user_id => @user.id, :answers_attributes => [] }
	  	end
      it "should create a new response" do
        expect {
          post :create, {:enquete_id => @survey.id, :response => @myresponse}
        }.to change(Response, :count).by(1)
      end

      it "redirects to the created response" do
        post :create, {:enquete_id => @survey.id, :response => @myresponse}
        response.should redirect_to(enquete_response_path(@survey, Response.last))
      end
    end
  end

  describe "GET show" do
    it "assigns the requested response as @response" do
    	myresponse = Response.create!({ :enquete_id => @survey.id, :user_id => @user.id, :answers_attributes => [] })
      get :show, {:enquete_id => @survey, :id => myresponse}
      assigns(:response).should eq(myresponse)
    end
  end

  # describe "DELETE destroy" do
  #   it "should redirect to response url" do
  #   	myresponse = Response.create!({ :enquete_id => @survey.id, :user_id => @user.id, :answers_attributes => [] })
  #     delete :destroy, {:id => myresponse}
  #     response.should redirect_to enquete_responses_url(@survey.id)
  #   end
  # end	

end