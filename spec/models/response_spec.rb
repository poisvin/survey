require 'spec_helper'

describe Response do
	it { should respond_to :enquete_id }
	it { should respond_to :user_id }

	describe "check enquete presence" do
		it "should validate enquete" do
			response = FactoryGirl.build(:response, :enquete => nil)
			response.should have(1).errors_on(:enquete)
		end
	end

	describe "creating response" do
		before :each do 
			@response = FactoryGirl.create(:response)
		end

	  it "should create answer response" do
	  	answer = FactoryGirl.create(:answer, {:response => @response})
	    @response.answers.size.should be_eql 1
	  end

	  it "should create a response with numeric answers" do
	  	answer = FactoryGirl.create(:number, {:response => @response})
	    @response.answers.size.should be_eql 1
	  end

	  it "should create a response with date answers" do
	  	answer = FactoryGirl.create(:date, {:response => @response})
	    @response.answers.size.should be_eql 1
	  end
	end

end