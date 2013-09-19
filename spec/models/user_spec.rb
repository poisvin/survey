require 'spec_helper'

describe User do
  it { should respond_to :email }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :password_hash }
  it { should respond_to :password_salt }
  it { should respond_to :registration_token }
  it { should respond_to :verified }
  it { should respond_to :admin }

	describe "Email validation" do
    it "should validate presence of email" do
      user = FactoryGirl.build(:user, :email => "hw@yopmail.com")
      user.should be_valid
    end

    it "should validate uniqueness of email" do
      user = FactoryGirl.create(:user)
      dup_user = user.dup
      dup_user.should have(1).errors_on(:email)
    end

    it "should validate format of email" do
    	user = FactoryGirl.build(:user, {:email => "invalid_format"})
    	user.should have(1).errors_on(:email)
    end
	end

	describe "Password Validation" do
	  it "should validate presence of password" do
	    user = FactoryGirl.build(:user, :password => nil)
	    user.should_not be_valid
	  end
	  it "should validate confirmation_of password" do
	    user = FactoryGirl.build(:user, :password_confirmation => "wrong")
	    user.should have(1).errors_on(:password)
	  end
	end

  describe "validating on sign up" do
    it "should create password_salt" do
      user = FactoryGirl.create(:user)
      user.password_salt.should_not be_blank 
    end
    it "should create password_hash" do
      user = FactoryGirl.create(:user)
      user.password_hash.should_not be_blank 
    end
    it "should create registration_token" do
      user = FactoryGirl.create(:user)
      user.registration_token.should_not be_blank 
    end
  end

  describe "validating user login" do
    it "should validate user" do
      user = FactoryGirl.create(:user, :email => "hw@yopmail.com")
      login_user = User.authenticate(user.email,"123456")
      login_user.should be_eql user
    end
    it "should not allow invalid user" do
      user = FactoryGirl.create(:user, :email => "hw@yopmail.com")
      login_user = User.authenticate(user.email,"654321")
      login_user.should be_nil
    end
  end
end
