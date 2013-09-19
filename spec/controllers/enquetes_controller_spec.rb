require 'spec_helper'

describe EnquetesController do
	describe "Admin user" do
		before :each do 
	    @user = FactoryGirl.create(:admin_user)
	    session[:user_id] = @user.id
	    session[:admin] = true if @user.admin?
	  end

		describe "GET index" do
	    it "should retrieve all surveys" do
	      get :index
	      assigns(:surveys).should eq(Enquete.all)
	    end
	  end
	  describe "GET new" do
	    it "should create a new survey" do
	      get :new
	      assigns(:survey).should be_a_new(Enquete)
	    end
	  end

	  describe "GET show" do
	    it "retrieves the requested survey" do
	      # survey = Enquete.create(:title => "trial")
	      survey = Enquete.create(:title => "trial")
	      get :show, {:id => survey.to_param}
	      assigns(:survey).should eq(survey)
	    end
	  end

	  describe "POST create" do
	    describe "with valid details" do
	      it "should create a new Survey" do
	        expect {
	          post :create, {:survey =>{:title => "trial"} }
	        }.to change(Enquete, :count).by(1)
	      end

	      it "should redirect to the created survey" do
	        post :create, {:survey => {:title => "trial"}}
	        response.should redirect_to(Enquete.last)
	      end
	    end

	    describe "with invalid params" do
	      it "should render new template" do
	        Enquete.any_instance.stub(:save).and_return(false)
	        post :create, {:survey => { "title" => "" }}
	        response.should render_template("new")
	      end
	    end
  	end

	  describe "GET edit" do
	    it "should retrieve the resquested survey" do
	      survey = Enquete.create(:title => "trial")
	      get :edit, {:id => survey.to_param}
	      assigns(:survey).should eq(survey)
	    end
	  end

		describe "PUT update" do
	    describe "with valid params" do
	      it "shoukd update the survey" do
	        survey = Enquete.create!(:title => "trial")
	        put :update, {:id => survey, :enquete => {:title => "test" }}
	        survey.reload

	        survey.title.should eq("test")
	      end

	      it "should redirect to the shouldurvey" do
	        survey = Enquete.create(:title => "trial")
	        put :update, {:id => survey, :enquete =>  { "title" => "trial" }}
	        response.should redirect_to(survey)
	      end
	    end

	    describe "with invalid params" do
	      it "should not assign value" do
	        survey = Enquete.create(:title => "trial")
	        Enquete.any_instance.stub(:save).and_return(false)
	        put :update, {:id => survey, :enquete => { "title" => "" }}
	        assigns(:survey).should eq(survey)
	      end

	      it "should redirect to edit" do
	        survey = Enquete.create(:title => "trial")
	        Enquete.any_instance.stub(:save).and_return(false)
	        put :update, {:id => survey, :enquete => { "title" => "" }}
	        response.should render_template("edit")
	      end
	    end
	  end

	  describe "DELETE" do
	    it "should destroy the survey" do
	      survey = Enquete.create!(:title => "trial")
	      expect {
	        delete :destroy, {:id => survey}
	      }.to change(Enquete, :count).by(-1)
	    end

	    it "redirects to the surveys list" do
	      survey = Enquete.create!(:title => "trial")
	      delete :destroy, {:id => survey}
	      puts enquetes_url
	      response.should redirect_to(enquetes_url)
	    end
	  end
	end

	describe "Normal User" do 
	before :each do
      @user = FactoryGirl.create(:user)
      session[:user_id] = @user.id
      session[:admin] = nil 
    end

    describe "GET index" do
      it "should redirect to welcome controller" do
        get :index
        response.should redirect_to root_path
      end
    end

    describe "GET show" do
      it "should redirect to root url" do
        survey = Enquete.create!(:title => "trial")
        get :show, {:id => survey}
        response.should redirect_to root_path
      end
    end

    describe "GET new" do
      it "should redirect to root url" do
        get :new
        response.should redirect_to root_path
      end
    end

    describe "GET edit" do
      it "should redirect to root url" do
        survey = Enquete.create!(:title => "trial")
        get :edit, {:id => survey}
        response.should redirect_to root_path
      end
    end

    describe "POST create" do
      it "should redirect to root url" do
        post :create, {:enquete =>{:title => "trial"} }
        response.should redirect_to root_path
      end
    end

    describe "PUT update" do
      it "should redirect to root url" do
        survey = Enquete.create!(:title => "trial")
        put :update, {:id => survey, :enquete =>{:title => "trial"} }
        response.should redirect_to root_path
      end
    end

    describe "DELETE destroy" do
      it "should redirect to root url" do
        survey = Enquete.create!(:title => "trial")
        delete :destroy, {:id => survey}
        response.should redirect_to root_path
      end
    end		
	end
end

