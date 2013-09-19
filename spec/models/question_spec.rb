require 'spec_helper'

describe Question do
  it { should respond_to :enquete_id }
	it { should respond_to :content }
	it { should respond_to :type }

  describe "creating question" do
    describe "EssayQuestion" do
      before :each do
        @question = FactoryGirl.create(:question)
      end

      it "should be valid" do
        @question.should be_valid
      end

      it "should be of type EssayQuestion" do
        @question.type.should be_eql 'EssayQuestion'
      end
    end

    describe "NumericQuestion" do
      before :each do
        @question = FactoryGirl.create(:numeric_question)
      end

      it "should be valid" do
        @question.should be_valid
      end

      it "should be of type NumericQuestion" do
        @question.type.should be_eql 'NumericQuestion'
      end
    end
    
    describe "DateQuestion" do
      before :each do
        @question = FactoryGirl.create(:date_question)
      end

      it "should be valid" do
        @question.should be_valid
      end

      it "should be of type DateQuestion" do
        @question.type.should be_eql 'DateQuestion'
      end
    end
  end
end
