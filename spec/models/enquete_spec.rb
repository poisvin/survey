require 'spec_helper'

describe Enquete do
  it { should respond_to :title }
  it { should respond_to :description }


  describe "Creating enquete " do
    before :each do 
      @enquete = FactoryGirl.create(:enquete)
    end

  	it "should create questions" do
  	  @enquete.questions.size.should be_eql 0
  	end

  	it "should create essay question" do
      FactoryGirl.create(:question, :enquete => @enquete)
      @enquete.questions.size.should be_eql 1
    end
    
    it "should create numeric question" do
      FactoryGirl.create(:numeric_question, :enquete => @enquete)
      @enquete.numeric_questions.size.should be_eql 1
    end
    
    it "should create date question" do
      FactoryGirl.create(:date_question, :enquete => @enquete)
      @enquete.date_questions.size.should be_eql 1
    end
  end

end
