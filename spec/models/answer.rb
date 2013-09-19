require 'spec_helper'

describe Answer do
	it { should respond_to :content }
	it { should respond_to :response_id }
  it { should respond_to :question_id }

  describe "Validating data" do
  	before :each do 
  		@response = FactoryGirl.build(:response)
  	end

  	it "should be valid data" do
  	  answer = FactoryGirl.build(:answer, {:response => @response})
  	  answer.should be_valid
  	end

    it "should have content" do
      answer = FactoryGirl.build(:empty_content, {:response => @response})
      answer.should have(1).errors_on(:content)
    end


    it "should validate question" do
      answer = FactoryGirl.build(:empty_question, {:response => @response})
      answer.should have(1).errors_on(:question)
    end

    describe " On Invalid Answer" do
      it "should validate number question" do
        question = FactoryGirl.create(:numeric_question)
        answer = FactoryGirl.build(:answer,{:question => question, :response => @response })
        answer.should have(1).errors_on(:content)
      end

      it "should validate date question." do
        question = FactoryGirl.create(:date_question)
        answer = FactoryGirl.build(:answer, {:question => question, :response => @response })
        answer.should have(1).errors_on(:content)
      end
    end

    describe "On Valid answer" do
      it "should accept numbers for numeric question." do
        question = FactoryGirl.create(:numeric_question)
        answer = FactoryGirl.build(:number,{:question => question, :response => @response })
        answer.should have(0).errors_on(:content)
      end

      it "should accept date for date question." do
        question = FactoryGirl.create(:date_question)
        answer = FactoryGirl.build(:date,{:question => question, :response => @response })
        answer.should have(0).errors_on(:content)
      end
    end
  end
end
